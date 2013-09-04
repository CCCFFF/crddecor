class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(:email => params[:email])
    if @user.present? #&& @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "User Logged In"
      redirect_to homes_url
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = "User Logged Out"
    rediect_to homes_url
  end

end
