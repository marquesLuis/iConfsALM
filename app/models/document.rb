class Document < ActiveRecord::Base
  attr_accessible :description, :link, :title

  has_many :authors, :inverse_of => :document
  has_many :people, :through => :authors
  has_many :event_documents
  has_many :events, :through => :event_documents

  validates :title, :presence => true
  validates :description, :presence => true
  validates :links, :presence => true

end
