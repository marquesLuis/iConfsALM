class CreateRemovedLocations < ActiveRecord::Migration
  def change
    create_table :removed_locations do |t|
      t.integer :server_id

      t.timestamps
    end
  end
end
