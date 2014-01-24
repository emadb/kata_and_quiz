
require "./app.rb"

describe MarkAndToys do
  before do
    
  end

  it 'first case' do
    mat = MarkAndToys.new(50, [1,12,5,111,200,1000,10])
    expect(mat.how_many_toys).to eq(4)

  end

end