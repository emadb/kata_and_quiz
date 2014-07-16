require './lib/engine'

describe Engine do
  before do
    @engine = Engine.new(6,7)
  end

  it 'move forward to North' do
    @engine.process 'f', Math::PI/2
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(8)
  end

  it 'move backward to South' do
    @engine.process 'b', Math::PI/2
    expect(@engine.x).to eq(6)
    expect(@engine.y).to eq(6)
  end

  it 'move forward to East' do
    @engine.process 'f', 0
    expect(@engine.x).to eq(7)
    expect(@engine.y).to eq(7)
  end

    it 'move backward to West' do
    @engine.process 'f', Math::PI*3/2
    expect(@engine.x).to eq(5)
    expect(@engine.y).to eq(7)
  end

end