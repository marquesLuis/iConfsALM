class CreateAboutEvents < ActiveRecord::Migration
  def change
    create_table :about_events do |t|
      t.integer :note_id
      t.integer :event_id

      t.timestamps
    end
  end
end
