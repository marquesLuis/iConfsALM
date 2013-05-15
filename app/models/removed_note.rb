class RemovedNote < ActiveRecord::Base
  attr_accessible :person_id, :sequence_number

  default_scope :order => :created_at

  belongs_to :person, :inverse_of => :removed_notes

  validates :sequence_number, :presence => true
  validates :sequence_number, :numericality => { :greater_than_or_equal_to => 0 }

  validates_associated :person
end
