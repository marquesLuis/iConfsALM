class RejectedContact < ActiveRecord::Base
  attr_accessible :requested_id, :requester_id

  belongs_to :requester, :class_name => 'Person', :inverse_of => :sent_rejected_requests
  belongs_to :requested, :class_name => 'Person', :inverse_of => :received_rejected_requests

  validates_associated :requester
  validates_associated :requested
end
