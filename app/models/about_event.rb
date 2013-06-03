class AboutEvent < ActiveRecord::Base
  attr_accessible :event_id, :note_id

  belongs_to :note
  belongs_to :event
end
