class Event < ActiveRecord::Base
  attr_accessible :begin, :description, :end, :event_group_id, :event_kind, :title

  SESSION_TYPES = ['Workshop', 'Paper Session', 'Keynote', 'Social Event', 'Demo', 'Tutorial']

  has_many :notes_about, :class_name => 'Note', :inverse_of => :about_event
  has_one :speaker, :inverse_of => :events
  has_one :person, :through => :speaker
  has_many :documents, :inverse_of => :event
  belongs_to :event_group, :inverse_of => :events

  validates :title, :presence => true
  validates :event_kind, :inclusion => SESSION_TYPES
  validates :begin, :presence => true
  validates :end, :presence => true
end
