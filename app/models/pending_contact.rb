class PendingContact < ActiveRecord::Base
  attr_accessible :requested_id, :requester_id

  belongs_to :requester, :class_name => 'Person', :inverse_of => :sent_pending_requests
  belongs_to :requested, :class_name => 'Person', :inverse_of => :received_pending_requests

  validates_associated :requester
  validates_associated :requested

  validates_uniqueness_of :requested_id, :scope => [:requester_id]
end
