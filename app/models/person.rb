class Person < ActiveRecord::Base
  attr_accessible :affiliation, :biography, :calendar_version, :email, :first_name, :info_modification_time, :last_name, :photo, :prefix

  PREFIX_TYPES = ['Dr.','Sr.']

  has_many :messages, :inverse_of => :person
  has_many :removed_notes, :inverse_of => :person
  has_many :notes, :inverse_of => :person
  has_many :notes_about, :class_name => 'Note', :inverse_of => :about_person
  has_one :registry, :inverse_of => :person
  has_many :sent_requests, :class_name => 'Contact', :foreign_key => :requester_id, :inverse_of => :requester
  has_many :received_requests, :class_name => 'Contact', :foreign_key => :requested_id, :inverse_of => :requested
  has_many :infos, :inverse_of => :person
  has_many :speakers, :inverse_of => :person
  has_many :events, :through => :speakers
  has_many :authors, :inverse_of => :person
  has_many :documents, :through => :authors
  has_many :event_groups
  has_many :org_notifications
  has_many :read_networking, :class_name => 'Networking'
  has_many :networkings, :inverse_of => :person
  has_many :area_of_interests, :inverse_of => :people
  has_many :sent_pending_requests, :class_name => 'PendingContact', :foreign_key => :requester_id, :inverse_of => :requester
  has_many :received_pending_requests, :class_name => 'PendingContact', :foreign_key => :requested_id, :inverse_of => :requested
  has_many :sent_rejected_requests, :class_name => 'RejectedContact', :foreign_key => :requester_id, :inverse_of => :requester
  has_many :received_rejected_requests, :class_name => 'RejectedContact', :foreign_key => :requested_id, :inverse_of => :requested

  validates :email, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  validates :affiliation, :presence => true
  validates :prefix, :inclusion => PREFIX_TYPES
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates_associated :event_groups
  validates_associated :read_networking
  validates_associated :org_notifications
end
