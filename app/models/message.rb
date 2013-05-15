class Message < ActiveRecord::Base
  attr_accessible :content, :person_id, :read
end
