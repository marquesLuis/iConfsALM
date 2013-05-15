class CreateRemovedNotifications < ActiveRecord::Migration
  def change
    create_table :removed_notifications do |t|
      t.integer :sequence_number

      t.timestamps
    end
  end
end
