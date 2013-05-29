class PersonInterest < ActiveRecord::Base
  attr_accessible :area_of_interest_id, :person_id

  belongs_to :area_of_interest
  belongs_to :person

end
