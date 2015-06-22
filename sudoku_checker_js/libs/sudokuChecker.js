
module.exports = function(board){
  var colums = checkColumns(board);
  var rows = checkRows(board);
  var squares = checkSquares(board);
  return colums && rows && squares;
}

function checkSquares(board){
  return checkSquare(board, 0, 0)
      && checkSquare(board, 0, 3)
      && checkSquare(board, 0, 6)
      && checkSquare(board, 3, 0)
      && checkSquare(board, 3, 3)
      && checkSquare(board, 3, 6)
      && checkSquare(board, 6, 0)
      && checkSquare(board, 6, 3)
      && checkSquare(board, 6, 6);
}

function checkSquare(board, sr, sc){
  var sum = 0;
  for(var r=sr;r<3+sr;r++){
    for(var c=sc;c<3+sc;c++){
      sum = sum + board[r][c];
    }
  }
  return sum == 45;
}

function checkColumns(board){
  for(var i=0;i<9;i++){
    var sum = board.map(function(line){ return line[i]}).reduce(function(acc, v) {return acc + v}, 0);
    if (sum !== 45){
      return false;
    }
  }
  return true;
}


function checkRows(board){
  var sum = board.reduce(function(acc1, line){
    var lineSum = line.reduce(function(acc2, current){ return acc2 + current;}, 0);
    return acc1 + lineSum;
  }, 0);
  return sum == 405;
}
