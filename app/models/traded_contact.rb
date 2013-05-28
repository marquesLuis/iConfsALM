class TradedContact < ActiveRecord::Base
  attr_accessible :requested_id, :requester_id

  belongs_to :requester, :class_name => 'Person'
  belongs_to :requested, :class_name => 'Person'

end
