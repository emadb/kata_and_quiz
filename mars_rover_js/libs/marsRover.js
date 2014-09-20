
module.exports = (function() {
  var pos, direction;

  var N, E, S, W;
  var directions;

  var commands;

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

    this.commands = {
      'L': this.turnLeft,
      'R': this.turnRight,
      'F': this.moveForward,
      'B': this.moveBackward
    };
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

  MarsRover.prototype.turn = function(rol){
    var index = this.directions.indexOf(this.direction);
    if (rol == 'R')
      index = index + 1;
    else
      index = index - 1;
    if (index == 4)
      index = 0;
     if (index == -1)
      index = 3;
    this.direction = this.directions[index];
  }

  MarsRover.prototype.turnLeft = function(){
    this.turn('L');
  };

  MarsRover.prototype.process = function(cmds){
    var _this = this;
    cmds.forEach(function(cmd){
      _this.commands[cmd].apply(_this);
    });
  };

  MarsRover.prototype.turnRight = function(){
   this.turn('R');
  };

  MarsRover.prototype.getPosition = function() {
    return this.pos;
  };

  MarsRover.prototype.getDirection = function(){
    return this.direction;
  };

	return MarsRover;

})();