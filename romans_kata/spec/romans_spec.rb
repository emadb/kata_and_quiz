require './lib/romans_converter'

describe Fixnum do
  it 'should convert 1 to I' do
    result = 1.to_roman
    expect(result).to eq("I")
  end  

  it 'should convert 2 to II' do
    result = 2.to_roman
    expect(result).to eq("II")
  end  

  it 'should convert 3 to III' do
    result = 3.to_roman
    expect(result).to eq("III")
  end  

  it 'should convert 4 to IV' do
    result = 4.to_roman
    expect(result).to eq("IV")
  end  

  it 'should convert 5 to V' do
    result = 5.to_roman
    expect(result).to eq("V")
  end  

  it 'should convert 6 to VI' do
    result = 6.to_roman
    expect(result).to eq("VI")
  end  

  it 'should convert 7 to VII' do
    result = 7.to_roman
    expect(result).to eq("VII")
  end  

  it 'should convert 9 to IX' do
    result = 9.to_roman
    expect(result).to eq("IX")
  end  
  it 'should convert 10 to X' do
    result = 10.to_roman
    expect(result).to eq("X")
  end  
  it 'should convert 12 to XII' do
    result = 12.to_roman
    expect(result).to eq("XII")
  end 
  it 'should convert 15 to XV' do
    result = 15.to_roman
    expect(result).to eq("XV")
  end
  it 'should convert 17 to XVII' do
    result = 17.to_roman
    expect(result).to eq("XVII")
  end 
  it 'should convert 19 to XIX' do
    result = 19.to_roman
    expect(result).to eq("XIX")
  end 
  it 'should convert 20 to XX' do
    result = 20.to_roman
    expect(result).to eq("XX")
  end 
  it 'should convert 30 to XXX' do
    result = 30.to_roman
    expect(result).to eq("XXX")
  end
  it 'should convert 42 to XLII' do
    result = 42.to_roman
    expect(result).to eq("XLII")
  end
  it 'should convert 1000 to M' do
    result = 1000.to_roman
    expect(result).to eq("M")
  end 
  it 'should convert 2014 to MMXIV' do
    result = 2014.to_roman
    expect(result).to eq("MMXIV")
  end 

end