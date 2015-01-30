
module.exports = (function() {
  var titles = {
    'woman':'Ms.',
    'man':'Mr.',
    'knight':'Sir',
  };

	var TeaParty = function() {
  };

	TeaParty.prototype.greet = function(name, surname, title) {
    return 'Hello ' + titles[title] + ' ' + surname;
	};

	return TeaParty;

})();