class PagesController < ApplicationController
  
  def home
    @title = "EventBase | Awesomeness"
  end
  
  def search
    @search_term = params[:search]
    @results = PgSearch.multisearch(params[:search])
  end
  
  
end