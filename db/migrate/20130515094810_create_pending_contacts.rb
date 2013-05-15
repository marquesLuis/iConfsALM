class CreatePendingContacts < ActiveRecord::Migration
  def change
    create_table :pending_contacts do |t|
      t.integer :requester_id
      t.integer :requested_id

      t.timestamps
    end
  end
end
