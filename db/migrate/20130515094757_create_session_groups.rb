class CreateSessionGroups < ActiveRecord::Migration
  def change
    create_table :session_groups do |t|
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
