class RemoveTypeFromInfos < ActiveRecord::Migration
  def up
    remove_column :infos, :type
  end

  def down
    add_column :infos, :type, :string
  end
end
