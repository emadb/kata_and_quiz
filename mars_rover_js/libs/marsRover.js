
module.exports = (function() {
  var pos, direction;

  var inc = function(i){
    return i++;
  };

	var MarsRover = function(x,y, direction) {
    this.pos = {};
    this.pos.x = x;
    this.pos.y = y;
    this.direction = direction;
	};

	MarsRover.prototype.moveForward = function() {

    var forward = {
      N: function(p){ p.y++; } ,
      S: function(p){ p.y--; } ,
      E: function(p){ p.x++; } ,
      W: function(p){ p.x--; } ,
    };

    forward[this.direction].apply(this, [this.pos]);
    
	};

  MarsRover.prototype.moveBackward = function() {

    var backward = {
      N: function(p){ p.y--; } ,
      S: function(p){ p.y++; } ,
      E: function(p){ p.x--; } ,
      W: function(p){ p.x++; } ,
    };

    backward[this.direction].apply(this, [this.pos]);
    
  };

  MarsRover.prototype.getPosition = function() {
    return this.pos;
  };

	return MarsRover;

})();