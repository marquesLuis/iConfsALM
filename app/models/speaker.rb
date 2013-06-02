class Speaker < ActiveRecord::Base
  attr_accessible :keynote, :person_id, :event_id

  belongs_to :person, :inverse_of => :speakers
  belongs_to :event, :inverse_of => :speaker

  validates_associated :person
  validates_associated :event
end
