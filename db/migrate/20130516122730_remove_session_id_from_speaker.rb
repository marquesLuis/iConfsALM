class RemoveSessionIdFromSpeaker < ActiveRecord::Migration
  def up
    remove_column :speakers, :session_id
  end

  def down
    add_column :speakers, :session_id, :integer
  end
end
