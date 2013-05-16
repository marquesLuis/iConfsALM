class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
