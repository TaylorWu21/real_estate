class AccountsController < ApplicationController
	before_action :authorize

  def show
  	@account = current_user.account
  end
end