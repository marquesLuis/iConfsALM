class Event < ActiveRecord::Base
  attr_accessible :date, :description, :duration, :event_group_id, :title, :type

  EVENT_TYPES = ['Workshop', 'Paper Session', 'Keynote', 'Social Event', 'Demo', 'Tutorial']

  has_many :notes_about, :class_name => 'Note', :inverse_of => :about_event
  has_one :speaker, :inverse_of => :events
  has_one :person, :through => :speaker
  has_many :documents, :inverse_of => :event
  belongs_to :event_group, :inverse_of => :events

  validates :title, :presence => true
  validates :type, :inclusion => EVENT_TYPES
  validates :date, :presence => true
  validates :duration, :presence => true
  validates :duration, :numericality => { :greater_than => 0 }

end
