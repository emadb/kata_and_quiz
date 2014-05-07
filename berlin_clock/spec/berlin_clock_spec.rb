require './lib/berlin_clock'

describe BerlinClock do
  it 'midnight all lights are off, but Y' do
    clock = BerlinClock.new(0,0,0)
    expect(clock.to_s).to eq("Y\nOOOO\nOOOO\nOOOOOOOOOOO\nOOOO")
  end  

  it '1 second after midnight all lights are off' do
    clock = BerlinClock.new(0,0,1)
    expect(clock.to_s).to eq("O\nOOOO\nOOOO\nOOOOOOOOOOO\nOOOO")
  end  

  it '1 hour after midnight third row has 1 light on' do
    clock = BerlinClock.new(1,0,0)
    expect(clock.to_s).to eq("Y\nOOOO\nROOO\nOOOOOOOOOOO\nOOOO")
  end  

  it '2 hours after midnight third row has 2 light on' do
    clock = BerlinClock.new(2,0,0)
    expect(clock.to_s).to eq("Y\nOOOO\nRROO\nOOOOOOOOOOO\nOOOO")
  end  

  it '5 hours after midnight second row has 1 light on' do
    clock = BerlinClock.new(5,0,0)
    expect(clock.to_s).to eq("Y\nROOO\nOOOO\nOOOOOOOOOOO\nOOOO")
  end  
  
  it '6 hours after midnight second row has 1 light on and third has 1 light' do
    clock = BerlinClock.new(6,0,0)
    expect(clock.to_s).to eq("Y\nROOO\nROOO\nOOOOOOOOOOO\nOOOO")
  end  
  
  it '13 hours after midnight second row has 2 lights on and third has 3 lights' do
    clock = BerlinClock.new(13,0,0)
    expect(clock.to_s).to eq("Y\nRROO\nRRRO\nOOOOOOOOOOO\nOOOO")
  end  

  it '1 minute after midnight last row has 1 lights on' do
    clock = BerlinClock.new(0,1,0)
    expect(clock.to_s).to eq("Y\nOOOO\nOOOO\nOOOOOOOOOOO\nYOOO")
  end  

  it '5 minutes after midnight minutes row has 1 lights on' do
    clock = BerlinClock.new(0,5,0)
    expect(clock.to_s).to eq("Y\nOOOO\nOOOO\nYOOOOOOOOOO\nOOOO")
  end  

  it '13:17:01' do
    clock = BerlinClock.new(13,17,01)
    expect(clock.to_s).to eq("O\nRROO\nRRRO\nYYROOOOOOOO\nYYOO")
  end

  it '23:59:59' do
    clock = BerlinClock.new(23,59,59)
    expect(clock.to_s).to eq("O\nRRRR\nRRRO\nYYRYYRYYRYY\nYYYY")
  end

  it '24:00:00' do
    clock = BerlinClock.new(24,00,00)
    expect(clock.to_s).to eq("Y\nRRRR\nRRRR\nOOOOOOOOOOO\nOOOO")
  end

end