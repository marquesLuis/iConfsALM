class Speaker < ActiveRecord::Base
  attr_accessible :keynote, :person_id, :session_id
end
