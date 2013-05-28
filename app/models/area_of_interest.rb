class AreaOfInterest < ActiveRecord::Base
  attr_accessible :name

  default_scope :order => :name

  has_many :group_areas
  has_many :event_groups, :through => :group_areas
  has_many :networkings, :inverse_of => :area_of_interests
  has_many :people, :inverse_of => :area_of_interests

  validates :name, :presence => true
  validates :name, :length => { :minimum => 1 }
end
