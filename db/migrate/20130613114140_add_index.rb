class AddIndex < ActiveRecord::Migration
  def up
    add_index :org_notifications, :updated_at
    add_index :events, :updated_at
    add_index :networkings, :updated_at
    add_index :people, :updated_at
    add_index :atending_events, :person_id
    add_index :atending_events, :event_id
    add_index :removed_attending_events, :person_id
    add_index :area_of_interests, :updated_at


    add_index :events, :event_group_id
    add_index :networkings, :person_id
    add_index :traded_contacts, :requested_id
    add_index :traded_contacts, :requester_id
    add_index :speakers, :person_id
    add_index :speakers, :event_id
    add_index :removed_notes, :person_id
    add_index :rejected_contacts, :requested_id
    add_index :rejected_contacts, :requester_id
    add_index :person_interests, :area_of_interest_id
    add_index :person_interests, :person_id
    add_index :notes, :person_id
    add_index :pending_contacts, :requested_id
    add_index :pending_contacts, :requester_id
    add_index :networking_interests, :area_of_interest_id
    add_index :networking_interests, :networking_id
    add_index :infos, :person_id
    add_index :group_areas, :area_of_interest_id
    add_index :group_areas, :event_group_id
    add_index :event_groups, :location_id
    add_index :event_documents, :document_id
    add_index :event_documents, :event_id
    add_index :authors, :document_id
    add_index :authors, :person_id
    add_index :about_people, :person_id
    add_index :about_people, :note_id
    add_index :about_events, :note_id
    add_index :about_events, :event_id
  end

  def down
  end
end
