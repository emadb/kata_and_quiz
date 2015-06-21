function processData(input) {
    var result = cutTheSticks(input.sort(), []);
    console.log(result);
} 

function cutTheSticks(elements, current){
  var cuts = elements.map(function(e) { return e - elements[0]});
  var remain = cuts.filter(function(e){ return e !== 0});
  current.push(cuts.length);
  if (remain.length <= 0){
      return current;
  }
  return cutTheSticks(remain, current)
}


process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = [];
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
  console.log(_input);
   processData(_input.split(' ').map(function(e){return parseInt(e)}));
});