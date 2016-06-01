class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Sign up complete!"
      redirect_to accounts_show_path
    else
      flash[:notice] = "Sign up failed."
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
