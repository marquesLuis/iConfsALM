class Speaker < ActiveRecord::Base
  attr_accessible :keynote, :person_id, :session_id

  belongs_to :person, :inverse_of => :speaker
  belongs_to :session, :inverse_of => :speaker

  validates_associated :person
  validates_associated :session
end
