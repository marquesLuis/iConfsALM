class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :prefix
      t.string :affiliation
      t.string :email
      t.string :photo
      t.text :biography
      t.integer :calendar_version
      t.datetime :info_modification_time

      t.timestamps
    end
  end
end
