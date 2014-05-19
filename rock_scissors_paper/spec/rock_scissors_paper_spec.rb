require './lib/rock_scissors_paper'

describe 'RockScissorsPaper' do
  before do
    @rock = Rock.new
    @scissors = Scissors.new
    @paper = Paper.new
  end

  it "When your move is rock and the opponent's move is scissors, you should win." do
    result = @rock.against_scissors
    expect(result).to eq('Player 1')
  end

  it "When your move is scissors and the opponent's move is rock, you should lose." do
    result = @scissors.against_rock
    expect(result).to eq('Player 2')
  end

  it "When your move is paper and the opponent's move is rock, you should win." do
    result = @paper.against_rock
    expect(result).to eq('Player 1')
  end

  it "When your move is rock and the opponent's move is paper, you should lose." do
    result = @rock.against_paper
    expect(result).to eq('Player 2')
  end

end

describe Paper do
  before do
    @paper = Paper.new
  end
  it 'wins against rock' do
    winner = @paper.against_rock
    expect(winner).to eq('Player 1')
  end
  it 'lose against scissors' do
    winner = @paper.against_scissors
    expect(winner).to eq('Player 2')
  end
  it 'draw against paper' do
    winner = @paper.against_paper
    expect(winner).to eq('Draw')
  end
end

describe Scissors do
  before do
    @scissors = Scissors.new
  end

  it 'lose against rock' do
    winner = @scissors.against_rock
    expect(winner).to eq('Player 2')
  end
  it 'wins against paper' do
     winner = @scissors.against_paper
    expect(winner).to eq('Player 1')
  end

  it 'draw against scissors' do
    winner = @scissors.against_scissors
    expect(winner).to eq('Draw')
  end
end


describe Rock do
  before do
    @rock = Rock.new
  end
  it 'wins against scissors' do
    winner = @rock.against_scissors
    expect(winner).to eq('Player 1')
  end
  it 'lose against paper' do
     winner = @rock.against_paper
    expect(winner).to eq('Player 2')
  end
  it 'draw against rock' do
    winner = @rock.against_rock
    expect(winner).to eq('Draw')
  end
end