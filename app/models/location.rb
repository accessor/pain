class Location < ActiveRecord::Base
  attr_accessible :area, :city, :code, :country, :pincode, :state, :status
  scope :unique_cities, :select => 'distinct city'
end
