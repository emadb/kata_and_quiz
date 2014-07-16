require './lib/mars_rover'

describe MarsRover do
  before do
    @rover = MarsRover.new(4,5, 'N')
  end

  it 'is not nil' do
    expect(@rover).not_to be_nil
  end

  it 'create a new rover at given position with give direction' do
    expect(@rover.x).to eq(4)
    expect(@rover.y).to eq(5)
    expect(@rover.direction).to eq('N')
  end

  it 'moves forward when receive a f command' do
    @rover.send_commands(['f'])
    expect(@rover.x).to eq(4)
    expect(@rover.y).to eq(6)
  end

  it 'moves forward two times when receive two f command' do
    @rover.send_commands(['f','f'])
    expect(@rover.x).to eq(4)
    expect(@rover.y).to eq(7)
  end

  it 'moves backwards when receive a b command' do
    @rover.send_commands(['b'])
    expect(@rover.x).to eq(4)
    expect(@rover.y).to eq(4)
  end

  it 'turns left when receive a l command' do
    @rover.send_commands(['l'])
    expect(@rover.direction).to eq('W')
  end

  it 'turns right when receive a r command' do
    @rover.send_commands(['r'])
    expect(@rover.direction).to eq('E')
  end
end