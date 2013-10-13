class Residential < Property
	attr_accessible :bedrooms
	BEDROOMS = ['1-BH', '1-BHK', '2BHK', '3-BHK', '4-BHK', '5-BHK' ]

	def bedrooms
		
	end

	def bedrooms=(bedrooms)
		details = read_attribute(:additional_details) || {}
		details[:bedrooms] = bedrooms
		write_attribute(:additional_details, details)
	end

	def bathrooms

	end

	def bathrooms=(bathrooms)

	end
end