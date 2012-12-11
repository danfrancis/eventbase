class PagesController < ApplicationController
  
  before_filter :authorize, except: [:home]
  
  def home
    @title = "EventBase | Awesomeness"
    @user = User.new
    @lists = current_user.lists if current_user
  end
  
  def search
    @search_term = params[:search]
    @results = PgSearch.multisearch(params[:search])
    if @results.length == 1
      redirect_to "/#{@results.first.searchable_type.downcase.pluralize}/#{@results.first.searchable_id}"
    end
  end
  
  def dashboard
    @title = 'EventBase | Dashboard'
    @lists = current_user.lists.includes(:trackers).order('list_type DESC').by_type(params[:type])
    @filters = current_user.filters.includes(:filterable).keep_if { |f| f.filterable.list_type == params[:type] }
    @locations = Venue.locations
    if @filters.any?
      @filtered_events = get_filtered_events(@filters, params[:type])
    else
      @events = Event.all
      @filtered_events = @events
    end
  end
  
  private
  
    def get_filtered_events(filters, type)
      if type == "Event"
        events = filters.map { |f| f.filterable.events }
      else
        companies = filters.map { |f| f.filterable.companies }.flatten
        events = companies.map { |c| c.events }.flatten
      end
      return events.flatten
    end
  
  
end