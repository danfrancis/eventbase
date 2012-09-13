class PagesController < ApplicationController
  
  def home
    @title = "EventBase | Awesomeness"
    @user = User.new
  end
  
  def search
    @search_term = params[:search]
    @results = PgSearch.multisearch(params[:search])
  end
  
  def dashboard
    @title = 'EventBase | Dashboard'
    @events = Event.all
    @sectors = Sector.all
  end
  
  
end