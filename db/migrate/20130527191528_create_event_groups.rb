class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.datetime :date
      t.time :end
      t.integer :location_id

      t.timestamps
    end
  end
end
