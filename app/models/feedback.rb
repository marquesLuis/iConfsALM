class Feedback < ActiveRecord::Base
  attr_accessible :content, :read

  default_scope :order => :created_at
  scope :read, where(:read => true)
  scope :not_read, where(:read => false)

  validates :content,:presence => true
end
