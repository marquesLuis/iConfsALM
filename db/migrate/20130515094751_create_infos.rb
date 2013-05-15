class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :type
      t.string :value
      t.integer :person_id

      t.timestamps
    end
  end
end
