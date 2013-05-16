class AddEventIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :event_id, :integer
  end
end
