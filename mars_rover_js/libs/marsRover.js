
module.exports = (function() {
  var pos, direction;

  var N, E, S, W;
  var directions;

  var incy = function(p){
    p.y++;
  };

  var incx = function(p){
    p.x++;
  };

  var decy = function(p){
    p.y--;
  };

  var decx = function(p){
    p.x--;
  };

	var MarsRover = function(x,y, direction) {
    this.N = 'N';
    this.E = 'E';
    this.S = 'S';
    this.W = 'W';

    this.directions = [this.N, this.E, this.S, this.W];
    this.pos = {};
    this.pos.x = x;
    this.pos.y = y;
    this.direction = direction;
	};

	MarsRover.prototype.moveForward = function() {

    var forward = {
      N: incy,
      S: decy ,
      E: incx ,
      W: decx ,
    };

    forward[this.direction].apply(this, [this.pos]);
    
	};

  MarsRover.prototype.moveBackward = function() {

    var backward = {
      N: decy,
      S: incy,
      E: decx ,
      W: incx ,
    };

    backward[this.direction].apply(this, [this.pos]);
    
  };

  MarsRover.prototype.turnLeft = function(){

    var index = this.directions.indexOf(this.direction);
    index = index - 1;
    if (index == -1)
      index = 3;
    if (index == 4)
      index = 0;
    this.direction = this.directions[index];
      
  };

  MarsRover.prototype.getPosition = function() {
    return this.pos;
  };

  MarsRover.prototype.getDirection = function(){
    return this.direction;
  };

	return MarsRover;

})();