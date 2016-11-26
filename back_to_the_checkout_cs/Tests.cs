using System;
using System.Collections.Generic;
using Xunit;

public class Tests 
{
    Checkout c;
    public Tests()
    {
        IDictionary<string, PriceFun> rules = new Dictionary<string, PriceFun>();
        rules.Add("A", q => q == 3? 130:50 * q);
        rules.Add("B", q => q == 2? 45:30 * q);

        c = new Checkout(rules);
    }

    [Fact]
    public void A_50()
    {
        c.Scan("A");
        Assert.Equal(50, c.GetTotal());
    }

    [Fact]
    public void AA_100()
    {
        c.Scan("A");
        c.Scan("A");
        Assert.Equal(100, c.GetTotal());
    }

    [Fact]
    public void AAA_130()
    {
        c.Scan("A");
        c.Scan("A");
        c.Scan("A");
        Assert.Equal(130, c.GetTotal());
    }

    [Fact]
    public void B_30()
    {
        c.Scan("B");
        Assert.Equal(30, c.GetTotal());
    }

    [Fact]
    public void B_45()
    {
        c.Scan("B");
        c.Scan("B");
        Assert.Equal(45, c.GetTotal());
    }

    [Fact]
    public void AB_80()
    {
        c.Scan("A");
        c.Scan("B");
        Assert.Equal(80, c.GetTotal());
    }
}