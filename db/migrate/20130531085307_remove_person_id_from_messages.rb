class RemovePersonIdFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :person_id
  end

  def down
    add_column :messages, :person_id, :integer
  end
end
