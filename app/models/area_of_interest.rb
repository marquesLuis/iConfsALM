class AreaOfInterest < ActiveRecord::Base
  attr_accessible :name

  has_many :event_groups, :inverse_of => :area_of_interests
  has_many :networkings, :inverse_of => :area_of_interests
  has_many :people, :inverse_of => :area_of_interests

  validates :name, :presence => true
  validates :name, :length => { :minimum => 1 }

  validates_associated :people
end
