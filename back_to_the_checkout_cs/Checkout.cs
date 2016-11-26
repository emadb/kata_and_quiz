using System;
using System.Collections.Generic;
using System.Linq;


public delegate int PriceFun(int qty);

public class Checkout
{
    private IDictionary<string, PriceFun> rules;
    private Dictionary<string, int> basket;

    public Checkout(IDictionary<string, PriceFun> rules)
    {
        this.rules = rules;
        this.basket = new Dictionary<string, int>();
    }

    internal void Scan(string sku)
    {
      if (!basket.ContainsKey(sku)){
        basket.Add(sku, 0);
      }    
      basket[sku]++;
    }

    internal decimal GetTotal()
    {
      return basket.Aggregate(0, (last, b) => {
        var price = rules[b.Key](b.Value);
        return last + price;
      });
    }
}