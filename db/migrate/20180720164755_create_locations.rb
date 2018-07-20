class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location
      t.references :machine, foreign_key: true
    end
  end
end
