class Note < ActiveRecord::Base
  attr_accessible :content, :person_id

  default_scope :order => :updated_at

  belongs_to :person, :inverse_of => :notes

  has_one :about_person
  has_one :about_event

  validates :content, :presence => true
  validates :person, :presence => true

  validates_associated :person
end
