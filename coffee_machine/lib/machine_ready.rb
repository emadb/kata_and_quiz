class MachineReady
	attr_reader :credit

	def initialize(machine, credit)
		@credit = credit
		@machine = machine
	end
	
	def insert_coin(amount)
		@credit += amount
		if @credit >= 50
			@machine.state = MachineReadyToDeliver.new(@machine, @credit)
		end
	end
end

class MachineReadyToDeliver
	def initialize(machine, credit)
		@credit = credit
		@machine = machine
	end
end