class AddSnacksToLocations < ActiveRecord::Migration[5.1]
  def change
    add_reference :locations, :snack, foreign_key: true
  end
end
