class CreateRemovedEvents < ActiveRecord::Migration
  def change
    create_table :removed_events do |t|
      t.integer :event_identifier

      t.timestamps
    end
  end
end
