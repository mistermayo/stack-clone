class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.authenticate(params[:email], params[:password])
      @user = User.find_by(:email => params[:email])
      session[:user_id] = @user.id
      current_user = User.find(@user.id)
      flash[:notice] = "You have logged in to Foto Friends, the hot new website!"
      redirect_to "/"
    else
      flash[:alert] = "Try Again"
      redirect_to log_in_path
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out... fare thee well..."
    redirect_to "/"
  end
end
