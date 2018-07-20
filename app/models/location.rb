class Location < ApplicationRecord
  belongs_to :snack
  belongs_to :machine
end