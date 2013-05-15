class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :hasPrivate
      t.integer :requester_id
      t.integer :requested_id

      t.timestamps
    end
  end
end
