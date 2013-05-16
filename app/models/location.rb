class Location < ActiveRecord::Base
  attr_accessible :image, :title

  has_many :event_groups, :inverse_of => location

  validates :title, :presence => true
  validates :title, :length => { :minimum => 1 }
  validates :image, :presence => true
  validates :image, :format =>{
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
