class CreateRemovedNotes < ActiveRecord::Migration
  def change
    create_table :removed_notes do |t|
      t.integer :sequence_number
      t.integer :person_id

      t.timestamps
    end
  end
end
