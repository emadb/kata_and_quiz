module.exports = (function() {

  var frames;

	var Bowling = function() {
    frames = [];
  };
  
  Bowling.prototype.roll = function(pins){
    var lastFrame = frames[frames.length - 1];

    if (lastFrame && lastFrame.second === undefined){
      if (lastFrame.first + pins === 10) {
        lastFrame.isSpare = true;
      }

      lastFrame.second = pins;
    } else {
      var newFrame = {first: pins};
      if (pins === 10){
        newFrame.second = 0;
        newFrame.isStrike = true;
      }
      frames.push(newFrame);
    } 
  };

  Bowling.prototype.inspectFrames = function(){
    console.log(frames);
  };

  Bowling.prototype.score = function(){
    
    var score = frames.reduce(function(acc, p){ 
      var sparePoints = 0;
      if (acc.wasSpare) {
        sparePoints = p.first;
      }

      if (acc.wasStrike){
        sparePoints = p.first + p.second;
      }

      return {
        wasSpare: p.isSpare,
        wasStrike: p.isStrike,
        points: (acc.points + sparePoints + p.first + (p.second || 0))
      };
    }, {wasSpare: false, wasStrike: false, points: 0});
    return score.points;
  };

	return Bowling;

})();
