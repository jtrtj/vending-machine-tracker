class Snack < ApplicationRecord
  has_many :locations
  has_many :machines, through: :locations
end