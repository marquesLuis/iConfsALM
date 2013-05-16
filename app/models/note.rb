class Note < ActiveRecord::Base
  attr_accessible :content, :person_id

  default_scope :order => :created_at;

  belongs_to :person, :inverse_of => :notes
  has_one :about_person, :class_name => 'Person', :inverse_of => :notes_about
  has_one :about_event, :class_name => 'Event', :inverse_of => :notes_about


  validates :content, :presence => true
  validates :person, :presence => true

  validates_associated :person
  validates_associated :about_person
  validates_associated :about_event
end
