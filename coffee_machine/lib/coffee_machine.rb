class CoffeeMachine
  attr_reader :credit
  attr_reader :state

  def initialize
    @credit = 0
    @state = MachineReady.new 
  end

  def insert_coin(amount)
    @credit += amount
  end

end


class MachineReady
end

