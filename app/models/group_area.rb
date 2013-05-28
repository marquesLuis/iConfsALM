class GroupArea < ActiveRecord::Base
  attr_accessible :area_of_interest_id, :event_group_id

  belongs_to :event_group
  belongs_to :area_of_interest

end
