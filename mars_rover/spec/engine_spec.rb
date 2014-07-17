require './lib/engine'

describe Engine do
  before do
    @e = 0
    @n = Math::PI/2
    @w = Math::PI
    @s = Math::PI*3/2
    @engine = Engine.new(6,7)
  end

  it 'move forward to North' do
    @engine.process 'f', @n
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(8)
  end

  it 'move backward to North' do
    @engine.process 'b', @n
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(6)
  end

  it 'move forward to South' do
    @engine.process 'f', @s
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(6)
  end

  it 'move backward to South' do
    @engine.process 'b', @s
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(8)
  end

  it 'move forward to East' do
    @engine.process 'f', @e
    expect(@engine.x).to eq(7)
    expect(@engine.y).to eq(7)
  end

  it 'move backward to East' do
    @engine.process 'b', @e
    expect(@engine.x).to eq(5)
    expect(@engine.y).to eq(7)
  end

  it 'move forward to West' do
    @engine.process 'f', @w
    expect(@engine.x).to eq(5)
    expect(@engine.y).to eq(7)
  end
  
  it 'move backward to West' do
    @engine.process 'b', @w
    expect(@engine.x).to eq(7)
    expect(@engine.y).to eq(7)
  end

end