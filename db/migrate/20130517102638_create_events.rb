class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :event_kind
      t.time :begin
      t.time :end
      t.integer :event_group_id

      t.timestamps
    end
  end
end
