class EventGroup < ActiveRecord::Base
  attr_accessible :date, :duration

  has_many :events, :inverse_of => :event_group
  has_one :location, :inverse_of => :event_groups
  has_many :area_of_interests, :inverse_of => :event_groups

  validates :date,:presence => true
  validates :duration, :presence => true
  validates :duration, :numericality => { :greater_than => 0 }

  validates_associated :events
  validates_associated :location
  validates_associated :area_of_interests

end
