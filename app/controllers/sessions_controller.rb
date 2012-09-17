class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:last_seen] = Time.now
      redirect_to dashboard_url
    else
      flash.now.alert = "Sorry, we didn't recognize your Email or Password. Please try again."
      redirect_to root_url
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  
end