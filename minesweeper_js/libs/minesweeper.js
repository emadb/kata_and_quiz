module.exports = (function() {

	var Minesweeper = function(r, c) {
    this.rows = r;
    this.cols = c;
  };

  function countStarNearby(row, col, rows){
		var count = 0
      + ((rows[row][col-1] == '*') | 0)
      + ((rows[row][col+1] == '*') | 0)
      + ((rows[row-1] && rows[row-1][col-1] == '*') | 0)
      + ((rows[row-1] && rows[row-1][col] == '*') | 0)
      + ((rows[row-1] && rows[row-1][col+1] == '*') | 0)
      + ((rows[row+1] && rows[row+1][col-1] == '*') | 0)
      + ((rows[row+1] && rows[row+1][col] == '*') | 0)
      + ((rows[row+1] && rows[row+1][col+1] == '*') | 0);
    return count;
  }

  Minesweeper.prototype.process  = function(input) {
    var rows = input.split("\n").map(function(r){ return r.split("") });
    // rows -> [[*,.,.], [.,.,.], ...]

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
