require 'rails_helper'

RSpec.describe 'vending machine show page' do
  before(:each) do
    @owner = Owner.create!(name: 'Golden Face')
    @machine1 = @owner.machines.create!(location: 'ASU MU')
    @snack1 = @machine1.snacks.create!(name: 'Nutter Butter', price: 1.29)
    @snack2 = @machine1.snacks.create!(name: 'Oatmeal Creampie', price: 0.99)
    @snack3 = @machine1.snacks.create!(name: 'Twinkie Two Pack', price: 0.75)
    @snack4 = @machine1.snacks.create!(name: 'Bang! Energy Cola', price: 2.29)
  end

  it 'lists all the snacks in the machine along with their price' do
    visit machine_path(@machine1)

    expect(page).to have_content(@machine1.location)

    @machine1.snacks.each do |snack|
      within("li#snack-#{snack.id}")do
      expect(page).to have_content(snack.name)
      expect(page).to have_content(snack.price)
    end
    end
  end

  it 'shows average price for all the machines snacks' do
    visit machine_path(@machine1)

    within("h3#avg_price")do
      expect(page).to have_content("Average Price: $1.33")
    end
  end
end
