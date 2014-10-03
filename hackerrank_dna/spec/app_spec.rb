

require "./app.rb"

describe SaveHumanity do
  before do
    @sh = SaveHumanity.new
  end
    it 'first case' do
      result = @sh.evaluate('abbab', 'ba')  
      expect(result).to eq([1, 2])
    end

    it 'second case' do
      result = @sh.evaluate('hello', 'world')  
      expect(result).to eq([])
    end

    it 'third case' do
      result = @sh.evaluate('banana', 'nan')  
      expect(result).to eq([0, 2])
    end
    
end