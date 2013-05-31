class Message < ActiveRecord::Base
  attr_accessible :content, :email, :read

  default_scope :order => :created_at
  scope :read, where(:read => true)
  scope :not_read, where(:read => false)

  validates :content,:presence => true
  validates :email, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
