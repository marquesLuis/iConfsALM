class CreateNetworkingInterests < ActiveRecord::Migration
  def change
    create_table :networking_interests do |t|
      t.integer :networking_id
      t.integer :area_of_interest_id

      t.timestamps
    end
  end
end
