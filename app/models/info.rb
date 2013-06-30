class Info < ActiveRecord::Base
  attr_accessible :person_id, :info_type, :value

  PREFIX_TYPES = ['', 'Phone', 'Email', 'Address', 'Facebook', 'LinkedIn', 'Twitter', 'Youtube', 'Website', 'Other']

  def self.get_types
    return PREFIX_TYPES
  end

  belongs_to :person, :inverse_of => :infos

  validates :value, :presence => true

  validates_associated :person
end
