class CreateRemovedNetworkings < ActiveRecord::Migration
  def change
    create_table :removed_networkings do |t|
      t.integer :net_identifier

      t.timestamps
    end
  end
end
