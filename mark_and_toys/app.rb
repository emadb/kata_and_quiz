class MarkAndToys
  def initialize(k, prices)
    @prices = prices.sort
    @k = k
  end
  def how_many_toys
    expense = 0
    index = 0
    while expense < @k
      expense += @prices[index]
      index += 1
    end
    index - 1
  end
end

nk = gets
prices = gets.split(' ')
n = nk.split(' ')[0].to_i
k = nk.split(' ')[1].to_i

int_prices = []
prices.each do |p|
  int_prices << p.to_i  
end

mat = MarkAndToys.new(k, int_prices)
result = mat.how_many_toys

puts result