class CreateGroupAreas < ActiveRecord::Migration
  def change
    create_table :group_areas do |t|
      t.integer :event_group_id
      t.integer :area_of_interest_id

      t.timestamps
    end
  end
end
