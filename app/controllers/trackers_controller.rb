class TrackersController < ApplicationController
  
  def create
    params[:tracker] = { list_id: params[:list_id], user_id: current_user.id, tracking_type: params[:tracking_type], tracking_id: params[:tracking_id] }
    tracker = Tracker.new(params[:tracker])
    tracker.save!
    redirect_to :back
  end
  
  def destroy
    tracker = Tracker.where("user_id = ? AND tracking_type = ? AND tracking_id = ?", current_user.id, params[:tracking_type], params[:tracking_id])
    if tracker.any?
      tracker.first.destroy
    end
    redirect_to :back
  end

end