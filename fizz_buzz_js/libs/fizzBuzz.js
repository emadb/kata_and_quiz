
module.exports = (function() {

  var fizzFun = function(n){
    if (n % 3 == 0)
      return 'fizz';
  };

  var buzzFun = function(n){
    if (n % 5 == 0)
      return 'buzz';
  };

  var funs = [fizzFun, buzzFun];

	var FizzBuzz = function() {

	};

	FizzBuzz.prototype.process = function(n) {
    return funs.map(function(f){
      return f(n) || '';  
    }).join('') || n;
	};

	return FizzBuzz;

})();