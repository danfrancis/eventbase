class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :authorize
  
  before_filter :find_lists
  
  http_basic_authenticate_with :name => ENV['http_username'], :password => ENV['http_password']
    
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end
    
  def authorize
    redirect_to root_url unless current_user
  end
  
  def find_lists
    @lists = current_user ? current_user.lists : []
  end
  
end
