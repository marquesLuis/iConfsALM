class EventGroup < ActiveRecord::Base
  attr_accessible :date, :end

  has_many :events, :inverse_of => :event_group
  has_one :location, :inverse_of => :event_groups
  has_many :area_of_interests, :inverse_of => :event_groups

  validates :date,:presence => true
  validates :end, :presence => true

end
