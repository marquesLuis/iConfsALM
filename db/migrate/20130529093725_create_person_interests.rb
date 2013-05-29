class CreatePersonInterests < ActiveRecord::Migration
  def change
    create_table :person_interests do |t|
      t.integer :person_id
      t.integer :area_of_interest_id

      t.timestamps
    end
  end
end
