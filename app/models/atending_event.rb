class AtendingEvent < ActiveRecord::Base
  attr_accessible :event_id, :person_id

  belongs_to :event
  belongs_to :person
end
