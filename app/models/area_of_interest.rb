class AreaOfInterest < ActiveRecord::Base
  attr_accessible :name

  default_scope :order => :name

  has_many :group_areas
  has_many :event_groups, :through => :group_areas
  has_many :networking_interests
  has_many :networking, :through => :networking_interests
  has_many :person_interests
  has_many :people, :through => :person_interests

  validates :name, :presence => true
  validates :name, :length => { :minimum => 1 }
end
