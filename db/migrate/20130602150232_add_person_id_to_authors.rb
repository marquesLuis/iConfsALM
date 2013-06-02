class AddPersonIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :person_id, :integer
  end
end
