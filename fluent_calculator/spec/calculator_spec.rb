require './lib/calculator'

describe Calculator do
  it 'should sum one and one' do
    result = Calculator.new.one.plus.one
    expect(result).to eq(2)
  end  

  it 'should sum one and two' do
    result = Calculator.new.one.plus.two
    expect(result).to eq(3)
  end  
end