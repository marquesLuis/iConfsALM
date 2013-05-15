class Note < ActiveRecord::Base
  attr_accessible :content, :person_id

  default_scope :order => :created_at;

  belongs_to :person, :inverse_of => :notes
  has_one :about_person, :class_name => 'Person', :inverse_of => :notes_about
  has_one :about_session, :class_name => 'Session', :inverse_of => :notes_about


  validates :content, :presence => true
  validates :person, :presence => true

  validates_associated :person
  validates_associated :about_person
  validates_associated :about_session
end
