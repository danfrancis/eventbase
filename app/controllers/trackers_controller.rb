class TrackersController < ApplicationController
  
  before_filter :authorize
  
  def create
    #current_kase.update_attributes(params[:kase])
    
    if params[:new_list].present?
      list = List.create!(list_type: params[:tracking_type], name: params[:new_list], user_id: current_user.id)
      params[:tracker] = { list_id: list.id, user_id: current_user.id, tracking_type: params[:tracking_type], tracking_id: params[:tracking_id] }
      tracker = Tracker.new(params[:tracker])
      tracker.save!
    elsif params[:tracker].present?
      params[:tracker][:list_id].each do |list_id|
        if list_id.present?
          params[:tracker] = { list_id: list_id, user_id: current_user.id, tracking_type: params[:tracking_type], tracking_id: params[:tracking_id] }
          tracker = Tracker.new(params[:tracker])
          tracker.save!
        end
      end
    end
    redirect_to :back
    
  end
  
  def destroy
    #tracker = Tracker.where("user_id = ? AND tracking_type = ? AND tracking_id = ?", current_user.id, params[:tracking_type], params[:tracking_id])
    # if tracker.any?
    #   tracker.first.destroy
    # end
    tracker = Tracker.find(params[:id])
    tracker.destroy
    redirect_to :back
  end

end