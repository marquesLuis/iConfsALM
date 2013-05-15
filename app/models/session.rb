class Session < ActiveRecord::Base
  attr_accessible :date, :description, :duration, :genera, :genng, :grourails, :trails, :type

  SESSION_TYPES = ['Workshop', 'Paper Session', 'Keynote', 'Social Event', 'Demo', 'Tutorial']

  has_many :notes_about, :class_name => 'Note', :inverse_of => :about_session
  has_one :speaker, :inverse_of => :sessions
  has_one :person, :through => :speaker
  has_many :documents, :inverse_of => :session
  belongs_to :session_group, :inverse_of => sessions

  validates :title, :presence => true
  validates :type, :inclusion => SESSION_TYPES
  validates :date, :presence => true
  validates :duration, :presence => true
  validates :duration, :numericality => { :greater_than => 0 }
end
