class CreateRemovedAuthors < ActiveRecord::Migration
  def change
    create_table :removed_authors do |t|
      t.integer :author_identifier

      t.timestamps
    end
  end
end
