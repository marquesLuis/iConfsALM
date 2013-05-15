class PendingContact < ActiveRecord::Base
  attr_accessible :requested_id, :requester_id
end
