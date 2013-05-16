class Document < ActiveRecord::Base
  attr_accessible :description, :link, :event_id, :title

  has_many :authors, :inverse_of => :document
  has_many :people, :through => :authors
  belongs_to :event, :inverse_of => :documents

  validates :title, :presence => true
  validates :description, :presence => true
  validates :links, :presence => true

  validates_associated :event
end
