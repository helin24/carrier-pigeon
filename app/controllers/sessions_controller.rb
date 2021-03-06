class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  def create

    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password]) # Need to fix
        session[:user_id] = @user.id
        redirect_to user_path(session[:user_id])
      else
        redirect_to login_path
      end
    else
      # flash[:error] = "Wrong login info"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
