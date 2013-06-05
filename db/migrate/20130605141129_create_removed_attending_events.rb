class CreateRemovedAttendingEvents < ActiveRecord::Migration
  def change
    create_table :removed_attending_events do |t|
      t.integer :removed_event
      t.integer :person_id

      t.timestamps
    end
  end
end
