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
end

# ```
# User Story 1 of 3

# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with 
# that vending machine along with their price
# ```

# ```
# User Story 2 of 3
# ​
# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine
# ```

# ### Example
# ```Don's Mixed Drinks
# Snacks
# * White Castle Burger: $3.50
# * Pop Rocks: $1.50
# * Flaming Hot Cheetos: $2.50
# Average Price: $2.50
# ```