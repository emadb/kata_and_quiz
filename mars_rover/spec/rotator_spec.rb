require './lib/rotator'

describe Rotator do
  before do
    @rover = Rotator.new()
  end

  it 'initial direction should be North' do
    expect(@rover.direction).to eq('N')
  end

  it 'rotate left should set direction to W' do
    @rover.left
    expect(@rover.direction).to eq('W')
  end

  it 'rotate right should set direction to E' do
    @rover.right
    expect(@rover.direction).to eq('E')
  end

  it 'rotate two times should set direction to S' do
    @rover.right
    @rover.right
    expect(@rover.direction).to eq('S')
  end

  it 'rotate four times right should set direction to N' do
    @rover.right
    @rover.right
    @rover.right
    @rover.right
    expect(@rover.direction).to eq('N')
  end

  it 'rotate four times left should set direction to N' do
    @rover.left
    @rover.left
    @rover.left
    @rover.left
    expect(@rover.direction).to eq('N')
  end

  it 'shold be possbile to initialize to a certain direction' do
    @rover = Rotator.new('W')
    expect(@rover.direction).to eq('W')
  end

end