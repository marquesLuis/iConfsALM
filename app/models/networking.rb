class Networking < ActiveRecord::Base
  attr_accessible :content, :person_id, :title

  belongs_to :person, :inverse_of => :networkings
  has_many :area_of_interests, :inverse_of => :networkings

  validates :title, :presence => true
  validates :content, :presence => true
  validates :content, :length => { :minimum => 1 }

  validates_associated :person
  validates_associated :area_of_interests
end
