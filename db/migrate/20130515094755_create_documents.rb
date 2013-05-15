class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :session_id

      t.timestamps
    end
  end
end
