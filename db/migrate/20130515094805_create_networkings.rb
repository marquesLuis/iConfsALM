class CreateNetworkings < ActiveRecord::Migration
  def change
    create_table :networkings do |t|
      t.string :title
      t.text :content
      t.integer :person_id

      t.timestamps
    end
  end
end
