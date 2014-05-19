# class Calculator

#   @@numbers = {one: 1, two: 2}
#   @@operators = {plus: :+}

#   def method_missing(name)
#     if @first_number.nil?
#       @first_number = @@numbers[name]
#       return self
#     end
#     if @operator.nil?
#       @operator = @@operators[name]
#       return self
#     end
#     @second_number = @@numbers[name]
#     @first_number.send @operator, @second_number
#   end
# end

class Calculator
  
  @@numbers = {one: '1', two: '2', plus: '+'}

  def initialize
    @current = ''
  end
    
  def method_missing(name)
    @current << @@numbers[name]
    if @current.length == 3
      return eval(@current)
    end
    self
  end
end