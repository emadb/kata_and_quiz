

require "./app.rb"

describe MeetingPoint do
  before do
    @mp = MeetingPoint.new
  end

=begin
5 ..2...
4 ......
3 ......
2 ..*...
1 1..3..
0 ....4. 
  012345

  1 => 2
  2 => 3
  3 => 1
  4 => 2
  T => 8
=end

    it 'first case' do
      points = [Point.new(0,1), Point.new(2,5), Point.new(3,1), Point.new(4,0)]
      result = @mp.evaluate(points)  
      expect(result).to eq(8)
    end

    # it 'second case' do
    #   points = [Point.new(12,-14), Point.new(-3,3), Point.new(-14,7), Point.new(-14,-3), Point.new(2,-12), Point.new(-1,-6)]
    #   result = @mp.evaluate(points)  
    #   expect(result).to eq(54)
    # end
end