using Xunit;

public class FizzBuzzTest 
{
    FizzBuzz _fb;

    public FizzBuzzTest()
    {
        _fb = new FizzBuzz();
    }

    [Theory]
    [InlineData(1)]
    [InlineData(2)]
    [InlineData(4)]
    [InlineData(7)]
    [InlineData(8)]
    public void With_N_should_return_N(int n)
    {
        var result = _fb.Parse(n);
        Assert.Equal(n.ToString(), result);
    } 

    [Theory]
    [InlineData(3)]
    [InlineData(6)]
    public void With_MultipleOf3_should_return_Fizz(int n)
    {
        var result = _fb.Parse(n);
        Assert.Equal("Fizz", result);
    }

    [Theory]
    [InlineData(5)]
    [InlineData(10)]
    public void With_MultipleOf5_should_return_Buzz(int n)
    {
        var result = _fb.Parse(n);
        Assert.Equal("Buzz", result);
    }

    [Theory]
    [InlineData(15)]
    [InlineData(30)]
    public void With_MultipleOf3And5_should_return_FizzBuzz(int n)
    {
        var result = _fb.Parse(n);
        Assert.Equal("FizzBuzz", result);
    }


}