class AddEventKindToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_kind, :integer
  end
end
