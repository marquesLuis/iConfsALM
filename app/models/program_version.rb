class ProgramVersion < ActiveRecord::Base
  attr_accessible :version

  validates :version, :presence => true
  validates :version, :numericality => { :greater_than_or_equal_to => 0 }
end
