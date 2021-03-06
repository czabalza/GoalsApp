class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      @current_user = @user
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["incorrect username or password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
