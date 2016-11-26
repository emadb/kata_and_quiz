using System;
using System.Collections.Generic;
using System.Linq;

public class FizzBuzz
{
    private IDictionary<int, string> _nums;

    public FizzBuzz()
    {
      _nums = new Dictionary<int, string>(){
        {3, "Fizz"},
        {5, "Buzz"}
      };
    }

    public string Parse(int num)
    {
      var partial = _nums.Aggregate("", (last, n) => {
        return (num % n.Key == 0)? last + n.Value: last;
      });

      if(String.IsNullOrEmpty(partial)){
        return num.ToString();
      }
      return partial;
    }
}