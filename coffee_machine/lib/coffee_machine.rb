require 'machine_ready'

class CoffeeMachine
  attr_accessor :state

  def initialize
    @state = MachineReady.new(self, 0)
  end

  def insert_coin(amount)
    @state.insert_coin(amount)
  end

  def credit
  	@state.credit
  end

end


