class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
    def set_current_user
    	ActiveRecord::Base.current_user = current_user
    end
end
