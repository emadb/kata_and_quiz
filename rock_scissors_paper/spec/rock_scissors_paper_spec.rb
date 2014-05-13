require './lib/rock_scissors_paper'

describe RockScissorsPaper do
  it "When your move is rock and the opponent's move is scissors, you should win." do
    game = RockScissorsPaper.new
    result = game.play(Rock.new, Scissors.new)
    expect(result).to eq('player 1')
  end  

  it "When your move is scissors and the opponent's move is rock, you should lose." do
    game = RockScissorsPaper.new
    result = game.play(Scissors.new, Rock.new)
    expect(result).to eq('player 2')
  end

  it "When your move is paper and the opponent's move is rock, you should win." do
    game = RockScissorsPaper.new
    result = game.play(Paper.new, Rock.new)
    expect(result).to eq('player 1')
  end

  it "When your move is rock and the opponent's move is paper, you should lose." do
    game = RockScissorsPaper.new
    result = game.play(Rock.new, Paper.new)
    expect(result).to eq('player 2')
  end

end

describe Paper do
  before do
    @rock = Rock.new
    @paper = Paper.new
    @scissors = Scissors.new
  end
  it 'wins against rock' do
    winner = @paper.against(@rock)
    expect(winner).to eq(@paper)
  end
  it 'lose against scissors' do
     winner = @paper.against(@scissors)
    expect(winner).to eq(@scissors)
  end
end

describe Scissors do
  before do
    @rock = Rock.new
    @paper = Paper.new
    @scissors = Scissors.new
  end

  it 'lose against rock' do
    winner = @scissors.against(@rock)
    expect(winner).to eq(@rock)
  end
  it 'wins against paper' do
     winner = @scissors.against(@paper)
    expect(winner).to eq(@scissors)
  end
end


describe Rock do
  before do
    @rock = Rock.new
    @paper = Paper.new
    @scissors = Scissors.new
  end
  it 'wins against scissors' do
    winner = @rock.against(@scissors)
    expect(winner).to eq(@rock)
  end
  it 'lose against paper' do
     winner = @rock.against(@paper)
    expect(winner).to eq(@paper)
  end
end