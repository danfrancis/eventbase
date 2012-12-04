class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :authorize
  
  before_filter :get_current_companies_and_events
  
  http_basic_authenticate_with :name => ENV['http_username'], :password => ENV['http_password']
    
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end
  
  def get_current_companies_and_events
    companies = Company.all
    events = Event.all
    @companies_and_events = companies.keep_if { |c| c.name.present? && c.name.length > 0 } + events.keep_if { |e| e.name.present? && e.name.length > 0 }
  end
  
  def authorize
    redirect_to root_url unless current_user
  end
  
end
