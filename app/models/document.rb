class Document < ActiveRecord::Base
  attr_accessible :description, :link, :session_id, :title

  has_many :authors, :inverse_of => :document
  has_many :people, :through => :authors
  belongs_to :session, :inverse_of => :documents

  validates :title, :presence => true
  validates :description, :presence => true
  validates :links, :presence => true

  validates_associated :session
end
