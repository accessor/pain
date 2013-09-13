class Address < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :landline, :mobile, :name, :pincode, :state
end
