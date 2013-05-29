class AddInfoTypeToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :info_type, :string
  end
end
