require 'rails_helper'

RSpec.describe Machine, type: :model do
  before(:each) do
    @owner = Owner.create!(name: 'Golden Face')
    @machine1 = @owner.machines.create!(location: 'ASU MU')
    @machine2 = @owner.machines.create!(location: 'GCU Lawn')
    @machine3 = @owner.machines.create!(location: '40th')
    @snack1 = @machine1.snacks.create!(name: 'Nutter Butter', price: 1.29)
    @snack2 = @machine1.snacks.create!(name: 'Oatmeal Creampie', price: 0.99)
    @snack3 = @machine1.snacks.create!(name: 'Twinkie Two Pack', price: 0.75)
    @snack4 = @machine1.snacks.create!(name: 'Bang! Energy Cola', price: 2.29)
    @snack5 = @machine2.snacks.create!(name: 'Fig Newtons', price: 1.00)
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe '#avg_price' do
    it 'returns the average price of all snacks in the machine' do
      expect(@machine1.avg_price).to eq(1.33)
      expect(@machine2.avg_price).to eq(1.00)
      expect(@machine3.avg_price).to eq(0)
    end
  end
end

# I also see an average price for all of the snacks in that machine
