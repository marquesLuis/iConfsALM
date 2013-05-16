class RemoveSessionIdFromDocument < ActiveRecord::Migration
  def up
    remove_column :documents, :session_id
  end

  def down
    add_column :documents, :session_id, :integer
  end
end
