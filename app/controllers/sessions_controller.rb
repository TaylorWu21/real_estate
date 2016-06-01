class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Login Successful!"
      redirect_to accounts_show_path
    else
      flash[:success] = "Login Failed."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"
    redirect_to '/'
  end
end
