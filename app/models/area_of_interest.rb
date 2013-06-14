class AreaOfInterest < ActiveRecord::Base
  attr_accessible :name

  default_scope :order => :name

  has_many :group_areas
  has_many :event_groups, :through => :group_areas
  has_many :networking_interests
  has_many :networking, :through => :networking_interests
  has_many :person_interests
  has_many :people, :through => :person_interests

  validates :name, :presence => true
  validates :name, :length => {:minimum => 1}

  def get_documents
    return Document.find_by_sql("SELECT DISTINCT documents.* FROM documents INNER JOIN event_documents ON documents.id=event_documents.document_id INNER JOIN events ON event_documents.event_id=events.id INNER JOIN event_groups ON event_groups.id=events.event_group_id INNER JOIN group_areas ON group_areas.event_group_id=event_groups.id WHERE group_areas.area_of_interest_id == "<<id.to_s)
  end
end
