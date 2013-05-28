class CreateEventDocuments < ActiveRecord::Migration
  def change
    create_table :event_documents do |t|
      t.integer :document_id
      t.integer :event_id

      t.timestamps
    end
  end
end
