using System;
using System.Collections.Generic;
using System.Linq;

public class FizzBuzz
{
    private IList<Func<int, string>> _funcs;

    public FizzBuzz()
    {
      _funcs = new List<Func<int, string>>(){
        {n => n % 3 == 0 ? "Fizz":""},
        {n => n % 5 == 0 ? "Buzz":""}
      };
    }

    public string Parse(int num)
    {
      var partial = _funcs.Aggregate("", (last, f) => last + f(num));
      if(String.IsNullOrEmpty(partial)){
        return num.ToString();
      }
      return partial;
    }
}