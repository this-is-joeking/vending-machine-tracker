require 'rails_helper'

RSpec.describe 'snack show page' do
  before(:each) do
    @owner = Owner.create!(name: 'Golden Face')
    @machine1 = @owner.machines.create!(location: 'ASU MU')
    @machine2 = @owner.machines.create!(location: 'GCU Lawn')
    @machine3 = @owner.machines.create!(location: '40th')
    @machine4 = @owner.machines.create!(location: 'Press')
    @snack1 = @machine1.snacks.create!(name: 'Nutter Butter', price: 1.29)
    @machine2.snacks << @snack1
    @machine3.snacks << @snack1
    @snack2 = @machine1.snacks.create!(name: 'Oatmeal Creampie', price: 0.99)
    @snack3 = @machine1.snacks.create!(name: 'Twinkie Two Pack', price: 0.75)
    @snack4 = @machine1.snacks.create!(name: 'Bang! Energy Cola', price: 2.29)
    @snack5 = @machine2.snacks.create!(name: 'Fig Newtons', price: 1.00)
  end

  it 'displays name of snack, price, and list of locations' do
    visit snack_path(@snack1)

    expect(page).to have_content(@snack1.name)
    expect(page).to have_content(@snack1.price)
    @snack1.machines.each do |machine|
      within("li#machine-#{machine.id}") do
        expect(page).to have_content(machine.location)
        expect(page).to have_content("#{machine.number_of_snacks} kinds of snacks")
        expect(page).to have_content("average price of $#{machine.avg_price}")
      end
    end
  end
end
