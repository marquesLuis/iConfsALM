class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.boolean :keynote
      t.integer :person_id
      t.integer :session_id

      t.timestamps
    end
  end
end
