class EventDocument < ActiveRecord::Base
  attr_accessible :document_id, :event_id

  belongs_to :document, :inverse_of => :event_documents
  belongs_to :event, :inverse_of => :event_documents
end
