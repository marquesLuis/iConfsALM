class CreateRemovedAreas < ActiveRecord::Migration
  def change
    create_table :removed_areas do |t|
      t.integer :area_identifier

      t.timestamps
    end
  end
end
