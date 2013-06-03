class CreateAtendingEvents < ActiveRecord::Migration
  def change
    create_table :atending_events do |t|
      t.integer :event_id
      t.integer :person_id

      t.timestamps
    end
  end
end
