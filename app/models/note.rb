class Note < ActiveRecord::Base
  attr_accessible :content, :person_id
end
