class Author < ActiveRecord::Base
  attr_accessible :document_id, :name

  belongs_to :document, :inverse_of => :author
  has_one :person, :inverse_of => :author

  validates_associated :document
  validates_associated :person
end
