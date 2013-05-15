class SessionGroup < ActiveRecord::Base
  attr_accessible :date, :duration

  has_many :sessions, :inverse_of => :session_group
  has_one :location, :inverse_of => :session_groups
  has_many :area_of_interests, :inverse_of => session_groups

  validates :date,:presence => true
  validates :duration, :presence => true
  validates :duration, :numericality => { :greater_than => 0 }

  validates_associated :sessions
  validates_associated :location
  validates_associated :area_of_interests
end
