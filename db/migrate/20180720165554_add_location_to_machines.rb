class AddLocationToMachines < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :location, foreign_key: true
  end
end
