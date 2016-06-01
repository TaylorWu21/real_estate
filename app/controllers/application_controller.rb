class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	#first time called @current_user is nil
  	#second time its called 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
  	redirect_to 'login' unless current_user	
  end
end
