class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :type
      t.datetime :date
      t.integer :duration
      t.integer :event_group_id

      t.timestamps
    end
  end
end
