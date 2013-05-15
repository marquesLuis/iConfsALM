class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :trails
      t.string :genng
      t.text :description
      t.string :type
      t.datetime :date
      t.integer :duration
      t.string :grourails
      t.integer :genera

      t.timestamps
    end
  end
end
