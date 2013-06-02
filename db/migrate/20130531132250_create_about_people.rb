class CreateAboutPeople < ActiveRecord::Migration
  def change
    create_table :about_people do |t|
      t.integer :person_id
      t.integer :note_id

      t.timestamps
    end
  end
end
