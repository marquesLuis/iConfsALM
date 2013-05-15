class Document < ActiveRecord::Base
  attr_accessible :description, :link, :session_id, :title
end
