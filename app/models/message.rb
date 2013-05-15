class Message < ActiveRecord::Base
  attr_accessible :content, :person_id, :read

  default_scope :order => :created_at;
  scope :read, where(:read => true)
  scope :not_read, where(:read => false)

  belongs_to :person, :inverse_of => :messages

  validates :content,:presence => true
  validates :person,:presence => true

  validates_associated :person
end
