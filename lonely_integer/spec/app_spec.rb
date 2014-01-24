
require "./app.rb"

describe 'LonelyInteger' do
  before do
    
  end

  it 'first case' do
    li = lonelyinteger([1,1,2])
    expect(li).to eq(2)
  end

  it 'second case' do
    li = lonelyinteger([4,9,95,93,57,4,57,93,9])
    expect(li).to eq(95)
  end

  it 'third case' do
    li = lonelyinteger([0,0,1,2,1])
    expect(li).to eq(2)
  end

end