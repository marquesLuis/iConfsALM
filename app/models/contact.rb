class Contact < ActiveRecord::Base
  attr_accessible :hasPrivate, :requested_id, :requester_id
end
