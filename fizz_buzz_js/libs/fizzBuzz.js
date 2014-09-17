
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

    var result = funs.map(function(f){
      return f(n) || '';  
    }).reduce(function(p, c){
        return p + c;
    });
  
    if (result == '')
      return n;
    return result;
	};

	return FizzBuzz;

})();