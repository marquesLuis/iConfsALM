class AboutPerson < ActiveRecord::Base
  attr_accessible :note_id, :person_id

  belongs_to :note
  belongs_to :person
end
