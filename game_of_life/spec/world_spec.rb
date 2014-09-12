require './lib/world'

describe World do
  before do
    @world = World.new
  end

  it 'set cell alive should set the cell to live' do
    @world.set_alive(1,1)
    expect(@world.is_alive?(1,1)).to be true
  end

  it 'set cell alive, other cells should be dead' do
    @world.set_alive(1,1)
    expect(@world.is_alive?(2,1)).to be false
  end

  context 'a live cell with neighbours' do
    it '0 neighbours count should be 0' do
      expect(@world.neighbours_count(5,6)).to eq(0)
    end

    it 'should not count itself' do
      @world.set_alive(6,6)
      expect(@world.neighbours_count(6,6)).to eq(0)
    end

    it '1 neighbours count should be 1' do
      @world.set_alive(6,6)
      expect(@world.neighbours_count(5,6)).to eq(1)
    end

    it '2 neighbours count should be 2' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)
      expect(@world.neighbours_count(5,6)).to eq(2)
    end

    it '3 neighbours count should be 2' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)
      @world.set_alive(6,7)
      expect(@world.neighbours_count(5,6)).to eq(3)
    end
  end

  context 'game rules' do
    it 'Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)

      @world.tick

      expect(@world.is_alive?(6,5)).to be false
    end

    it 'Any live cell with more than three live neighbours dies, as if by overcrowding.' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)
      @world.set_alive(6,4)
      @world.set_alive(5,5)
      @world.set_alive(7,5)

      @world.tick

      expect(@world.is_alive?(6,5)).to be false
    end

    it ' Any live cell with two live neighbours lives on to the next generation.' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)
      @world.set_alive(6,4)

      @world.tick

      expect(@world.is_alive?(6,5)).to be true
    end

    it ' Any live cell with three live neighbours lives on to the next generation.' do
      @world.set_alive(6,6)
      @world.set_alive(6,5)
      @world.set_alive(6,4)
      @world.set_alive(7,5)

      @world.tick

      expect(@world.is_alive?(6,5)).to be true
    end

    it 'Any dead cell with exactly three live neighbours becomes a live cell.' do
    end

  end

end