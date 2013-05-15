class OrgNotification < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :presence => true
  validates :content, :presence => true
  validates :content, :length => { :minimum => 1 }
end
