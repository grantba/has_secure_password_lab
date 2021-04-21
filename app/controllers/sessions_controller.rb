class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "There was an issue logging you into your account. Please try again."
      redirect_to '/'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
