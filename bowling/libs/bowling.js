module.exports = (function() {

	var Minesweeper = function(r, c) {
    this.rows = r;
    this.cols = c;
  };
  function isAStar(row, col, rows){
    return (rows[row] && rows[row][col] == '*') | 0;
  }

  function countStarNearby(row, col, rows){
		var count = 0
      + isAStar(row, col-1, rows)
      + isAStar(row, col+1, rows)
      + isAStar(row-1, col-1, rows)
      + isAStar(row-1, col, rows)
      + isAStar(row-1, col+1, rows)
      + isAStar(row+1, col-1, rows)
      + isAStar(row+1, col, rows)
      + isAStar(row+1, col+1, rows);

    return count;
  }

  Minesweeper.prototype.process  = function(input) {
    var rows = input.split("\n").map(function(r){ return r.split("") });
    var result = [];

    rows.forEach(function(row, r){
      var newRow = row.map(function(e, c){
        if (e === "*"){
          return e;
        } else {
          return countStarNearby(r, c, rows);
        }
      });
      result.push(newRow.join(""));

    }.bind(this));
    return result.join("\n");
  };


	return Minesweeper;

})();
