class PagesController < ApplicationController
  
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
    @events = Event.all
    @sectors = Sector.all
    @lists = current_user.lists.includes(:trackers).order('list_type DESC')
    @filters = current_user.filters.includes(:filterable)
    if @filters.any?
      @filtered_events = get_filtered_events(@filters)
    else
      @filtered_events = @events
    end
  end
  
  private
  
    def get_filtered_events(filters)
      events = Array.new()
      filters.each do |f|
        if f.filterable.class.name == "Event"
          events.push(f.filterable)
        elsif f.filterable.class.name == "List"
          if f.filterable.list_type == "Company"
            f.filterable.companies.map { |c| events.concat(c.events) }
          else
            events.concat(f.filterable.events)
          end
        end
      end
      return events.uniq!
    end
  
  
end