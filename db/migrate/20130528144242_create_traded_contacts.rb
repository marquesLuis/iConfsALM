class CreateTradedContacts < ActiveRecord::Migration
  def change
    create_table :traded_contacts do |t|
      t.integer :requester_id
      t.integer :requested_id

      t.timestamps
    end
  end
end
