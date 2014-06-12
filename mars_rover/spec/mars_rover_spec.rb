require './lib/mars_rover'

describe MarsRover do
  before do
    @rover = MarsRover.new
  end
  
  it 'is not nil' do
    expect(@rover).not_to be_nil
  end
end