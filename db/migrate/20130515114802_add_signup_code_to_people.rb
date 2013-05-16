class AddSignupCodeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :signup_code, :string
  end
end
