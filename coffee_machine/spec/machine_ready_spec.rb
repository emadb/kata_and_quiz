require './lib/machine_ready'

describe MachineReady do
  it 'accept money and credit should raise' do
    machine = MachineReady.new(nil, 0)
    machine.insert_coin(10)
    expect(machine.credit).to eq(10)
  end   

  it 'accept money and credit should raise' do
    machine = MachineReady.new(nil, 0)
    machine.insert_coin(10)
    machine.insert_coin(20)
    expect(machine.credit).to eq(30)
  end  

end