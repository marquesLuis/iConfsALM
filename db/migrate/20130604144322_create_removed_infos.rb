class CreateRemovedInfos < ActiveRecord::Migration
  def change
    create_table :removed_infos do |t|
      t.integer :info_identifier

      t.timestamps
    end
  end
end
