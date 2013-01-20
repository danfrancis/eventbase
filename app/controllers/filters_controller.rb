class FiltersController < ApplicationController
  
  before_filter :authorize
  
  # GET /filters
  # GET /filters.json
  def index
    @filters = Filter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filters }
    end
  end

  # GET /filters/1
  # GET /filters/1.json
  def show
    @filter = Filter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filter }
    end
  end

  # GET /filters/new
  # GET /filters/new.json
  def new
    @filter = Filter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filter }
    end
  end

  # GET /filters/1/edit
  def edit
    @filter = Filter.find(params[:id])
  end

  # POST /filters
  # POST /filters.json
  def create
    @filter = current_user.filters.new(params[:filter])

    respond_to do |format|
      if @filter.save
        if @filter.filterable.class.name == 'Location'
          format.html { redirect_to :back, notice: 'Filter was successfully created.' }
        else
          format.html { redirect_to dashboard_url(type: @filter.filterable.list_type), notice: 'Filter was successfully created.' }
        end
        format.json { render json: @filter, status: :created, location: @filter }
      else
        format.html { redirect_to :back, alert: 'Filter not created.' }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /filters/1
  # PUT /filters/1.json
  def update
    @filter = Filter.find(params[:id])

    respond_to do |format|
      if @filter.update_attributes(params[:filter])
        format.html { redirect_to @filter, notice: 'Filter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filters/1
  # DELETE /filters/1.json
  def destroy
    @filter = Filter.find(params[:id])
    @filter.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
  def remove
    filters = Filter.by_user_and_type(current_user.id, params[:type])
    filters.destroy_all
    redirect_to :back
  end
  
  def remove_all
    filters = current_user.filters
    filters.destroy_all
    redirect_to :back
  end
end
