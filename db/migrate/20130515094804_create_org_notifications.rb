class CreateOrgNotifications < ActiveRecord::Migration
  def change
    create_table :org_notifications do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
