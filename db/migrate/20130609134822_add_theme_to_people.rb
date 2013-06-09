class AddThemeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :theme, :integer, :default => 1
  end
end
