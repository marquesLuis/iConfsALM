class CreateProgramVersions < ActiveRecord::Migration
  def change
    create_table :program_versions do |t|
      t.integer :version

      t.timestamps
    end
  end
end
