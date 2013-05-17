class RemoveTypeFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :type
  end

  def down
    add_column :events, :type, :string
  end
end
