class UsersController < ApplicationController
	before_filter :authenticate_user!

	def your_account
		@user = current_user
	end

	def your_ads
		@ads = current_user.properties.order('created_at desc')
	end
end
