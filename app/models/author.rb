class Author < ActiveRecord::Base
  attr_accessible :document_id, :name, :person_id

  belongs_to :document, :inverse_of => :authors
  belongs_to :person, :inverse_of => :authors

  has_many :event_documents, :through => :document
  has_many :events, :through => :event_documents

end
