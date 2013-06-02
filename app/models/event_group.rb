class EventGroup < ActiveRecord::Base
  # attr_accessible :date, :end, :location_id
  attr_protected
  has_many :events, :inverse_of => :event_group
  belongs_to :location, :inverse_of => :event_groups
  has_many :group_areas
  has_many :area_of_interests, :through => :group_areas

  validates :date, :presence => true
  validates :end, :presence => true

  def self.first_day
    EventGroup.order('date asc').first.date
  end

  def self.last_day
    EventGroup.order('date asc').last.date
  end
end
