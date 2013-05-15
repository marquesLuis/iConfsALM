class RemovedNotification < ActiveRecord::Base
  attr_accessible :sequence_number

  default_scope :order => :created_at;

  validates :sequence_number, :presence => true
  validates :sequence_number, :numericality => { :greater_than_or_equal_to => 0 }
end
