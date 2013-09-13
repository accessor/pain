class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  private
  
    def set_current_user
    	ActiveRecord::Base.current_user = current_user
    end
end
