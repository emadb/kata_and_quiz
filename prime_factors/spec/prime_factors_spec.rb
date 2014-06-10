require './lib/prime_factors'

describe PrimeFactors do
  before do
    @prime_factors = PrimeFactors.new
  end
  
  it '1 => []' do
    result = @prime_factors.of(1)
    expect(result).to be_empty
  end

  it '2 => [2]' do
    result = @prime_factors.of(2)
    expect(result).to match_array([2])
  end

  it '3 => [3]' do
    result = @prime_factors.of(3)
    expect(result).to match_array([3])
  end

  it '4 => [2,2]' do
    result = @prime_factors.of(4)
    expect(result).to match_array([2,2])
  end

  it '5 => [5]' do
    result = @prime_factors.of(5)
    expect(result).to match_array([5])
  end

  it '6 => [2,3]' do
    result = @prime_factors.of(6)
    expect(result).to match_array([2,3])
  end

  it '7 => [7]' do
    result = @prime_factors.of(7)
    expect(result).to match_array([7])
  end

  it '8 => [2,2,2]' do
    result = @prime_factors.of(8)
    expect(result).to match_array([2,2,2])
  end

  it '9 => [3,3]' do
    result = @prime_factors.of(9)
    expect(result).to match_array([3,3])
  end

end