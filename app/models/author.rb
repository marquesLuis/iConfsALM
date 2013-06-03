class Author < ActiveRecord::Base
  attr_accessible :document_id, :name, :person_id

  belongs_to :document, :inverse_of => :authors
  belongs_to :person, :inverse_of => :authors

end
