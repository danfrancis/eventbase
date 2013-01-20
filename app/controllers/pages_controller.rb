class PagesController < ApplicationController
  
  before_filter :authorize, except: [:home]
  
  def home
    @title = "EventBase | Awesomeness"
    @user = User.new
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
    @lists_by_type = @lists.includes(:trackers).order('list_type DESC').by_type(params[:type])
    @locations = Location.all_cached
    @filters = current_user.filters.includes(:filterable).keep_if { |f| f.filterable.class.name == 'Location' || f.filterable.list_type == params[:type]  }
  end
  
  def autocomplete
    @companies = Company.all_cached.keep_if { |c| c.name.present? && c.name.length > 0 }
    @events = Event.all_cached.keep_if { |e| e.name.present? && e.name.length > 0 }
    @sectors = Sector.all_cached
    
    respond_to do |format|
      format.json { render json: { companies: @companies, events: @events, sectors: @sectors, lists: @lists } }
    end
    
  end
  
  def get_filtered_events
    @filters = current_user.filters.includes(:filterable).keep_if { |f| f.filterable.class.name == 'Location' || f.filterable.list_type == params[:type]  }
    if @filters.any?
      if params[:type] == "Event"
        events = @filters.map { |f| f.filterable.events }
      else
        companies = @filters.map { |f| f.filterable.companies.includes(:events) }.flatten
        events = companies.map { |c| c.events }.flatten
      end
      @filtered_events = events.flatten
    else
      @filtered_events = Event.all_cached
    end
    
    @filtered_events.keep_if { |e| e.event_start_date && e.event_end_date }
      
    respond_to do |format|
      format.json { render json: @filtered_events.to_json(methods: [:title, :start, :end, :attending_number, :attending ])  }
    end
      
  end

end