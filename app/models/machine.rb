class Machine < ApplicationRecord
  belongs_to :owner

  has_many :locations
  has_many :snacks, through: :locations

  def average_snack_price
    snacks.average(:price)
  end
end
