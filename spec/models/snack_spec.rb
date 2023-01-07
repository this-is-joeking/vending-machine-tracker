require 'rails_helper'

RSpec.describe Snack do
 describe 'relationships' do
    it { should have_many :machine_snacks}
    it { should have_many(:machines).through(:machine_snacks) }
    it { should have_many(:owners).through(:machines)}
  end
end