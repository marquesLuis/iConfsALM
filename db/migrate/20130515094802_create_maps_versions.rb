class CreateMapsVersions < ActiveRecord::Migration
  def change
    create_table :maps_versions do |t|
      t.integer :version

      t.timestamps
    end
  end
end
