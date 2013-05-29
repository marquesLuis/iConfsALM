class Info < ActiveRecord::Base
  attr_accessible :person_id, :info_type, :value

  belongs_to :person, :inverse_of => :infos

  validates :info_type, :presence => true
  validates :value, :presence => true

  validates_associated :person
end
