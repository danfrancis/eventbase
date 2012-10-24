class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :get_current_companies_and_events
  
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
end
