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
  end
  
  
end