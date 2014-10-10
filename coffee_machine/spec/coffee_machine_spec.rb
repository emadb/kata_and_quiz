require './lib/coffee_machine'

describe CoffeeMachine do
  it 'accept money and credit should raise' do
    machine = CoffeeMachine.new
    machine.insert_coin(10)
    expect(machine.credit).to eq(10)
  end  

  it 'accept money and credit should raise' do
    machine = CoffeeMachine.new
    machine.insert_coin(10)
    machine.insert_coin(20)
    expect(machine.credit).to eq(30)
  end  

  it 'accept money and credit should raise' do
    machine = CoffeeMachine.new
    machine.insert_coin(10)
    machine.insert_coin(20)
    expect(machine.credit).to eq(30)
  end  

  it 'initial credit should be 0' do
    machine = CoffeeMachine.new
    expect(machine.credit).to eq(0)
  end  

  it 'initial state should be "ready"' do
    machine = CoffeeMachine.new
    expect(machine.state.class).to eq(MachineReady)
  end  

end