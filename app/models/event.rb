class Event < ActiveRecord::Base
  attr_accessible :begin, :description, :end, :event_group_id, :event_kind, :title

  EVENT_KIND = ['Workshop', 'Paper Session', 'Keynote', 'Social Event', 'Demo', 'Tutorial']

  has_many :about_events, :inverse_of => :event
  has_one :speaker, :inverse_of => :event
  has_one :person, :through => :speaker
  has_many :event_documents
  has_many :documents, :through => :event_documents
  has_many :authors, :through => :documents
  belongs_to :event_group, :inverse_of => :events

  validates :title, :presence => true
  validates :event_kind, :inclusion => EVENT_KIND
  validates :begin, :presence => true
  validates :end, :presence => true

  def event_kind_all
    EVENT_KIND
  end

  def self.get_types
    return EVENT_KIND
  end

  def self.min_hour
    return 8# Event.order(:begin).first.begin.hour
  end

  def self.max_hour
    return 22# Event.all(:order => 'end ASC').last.end.hour+1
  end
end
