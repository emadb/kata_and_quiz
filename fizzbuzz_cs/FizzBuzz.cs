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
      var partial = _nums.Aggregate((string)null, (last, n) => (num % n.Key == 0)? last + n.Value: last);
      return partial ?? num.ToString();
    }
}