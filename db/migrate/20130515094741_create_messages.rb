class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :read
      t.integer :person_id

      t.timestamps
    end
  end
end
