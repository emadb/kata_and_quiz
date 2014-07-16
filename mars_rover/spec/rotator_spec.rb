require './lib/rotator'

describe Rotator do
  before do
    @rotator = Rotator.new()
  end

  it 'initial direction should be North' do
    expect(@rotator.direction).to eq('N')
  end

  it 'rotate left should set direction to W' do
    @rotator.left
    expect(@rotator.direction).to eq('W')
  end

  it 'rotate right should set direction to E' do
    @rotator.right
    expect(@rotator.direction).to eq('E')
  end

  it 'rotate two times should set direction to S' do
    @rotator.right
    @rotator.right
    expect(@rotator.direction).to eq('S')
  end

  it 'rotate four times right should set direction to N' do
    @rotator.right
    @rotator.right
    @rotator.right
    @rotator.right
    expect(@rotator.direction).to eq('N')
  end

  it 'rotate four times left should set direction to N' do
    @rotator.left
    @rotator.left
    @rotator.left
    @rotator.left
    expect(@rotator.direction).to eq('N')
  end

  it 'should be possbile to initialize to a certain direction' do
    @rotator = Rotator.new('W')
    expect(@rotator.direction).to eq('W')
  end

  it 'process a command l as left' do
    @rotator.process 'l'
    expect(@rotator.direction).to eq('W')
  end

end