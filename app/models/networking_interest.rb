class NetworkingInterest < ActiveRecord::Base
  attr_accessible :area_of_interest_id, :networking_id

  belongs_to :area_of_interest
  belongs_to :networking

end
