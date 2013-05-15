class Person < ActiveRecord::Base
  attr_accessible :affiliation, :biography, :calendar_version, :email, :first_name, :info_modification_time, :last_name, :photo, :prefix

  has_many :messages
end
