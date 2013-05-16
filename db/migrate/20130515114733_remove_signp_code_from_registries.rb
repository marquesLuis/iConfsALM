class RemoveSignpCodeFromRegistries < ActiveRecord::Migration
  def up
    remove_column :registries, :signup_code
  end

  def down
    add_column :registries, :signup_code, :string
  end
end
