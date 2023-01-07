class Owner < ApplicationRecord
  validates_presence_of :name
  has_many :machines
  has_many :machine_snacks, through: :machines
  has_many :snacks, through: :machine_snacks
end
