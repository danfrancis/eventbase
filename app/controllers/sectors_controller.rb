class SectorsController < ApplicationController

  def show
    @sector = Sector.find(params[:id], include: [:events, :companies])
    @lists = current_user.lists
    @lists_event = @lists.by_type('Event')
    @lists_company = @lists.by_type('Company')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sector }
    end
  end
  
end