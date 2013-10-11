class Location < ActiveRecord::Base
  attr_accessible :area, :city, :code, :country, :pincode, :state, :status
end
