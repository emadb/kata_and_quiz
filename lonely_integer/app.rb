# class LonelyInteger
#   def initialize(numbers)
#     @numbers = numbers.sort
#   end

#   def whose_alone
#     i = 0
#     while i < @numbers.count - 1
#       break if @numbers[i] != @numbers[i+1]
#       i += 2
#     end
#     @numbers[i]
#   end
# end

def lonelyinteger( a) 
  i = 0
  while i < a.count - 1
    break if a[i] != a[i+1]
    i += 2
  end
  a[i]
end

# # Tail starts here
# a = gets.strip.to_i
# b = gets.strip.split(" ").map! {|i| i.to_i}
# print lonelyinteger(b)