class HomesController < ApplicationController
		before_action :seller
		before_action :home, only: [:show, :edit, :update, :destroy]
  def index
  	@homes = @seller.home
  end

  def show
  end

  def new
  	@home = Home.new
  end

  def create
  	@home = @seller.home.new(home_params)
  	if @home.save
  		flash[:success] = "New home has been created."
  		redirect_to seller_homes_path(@seller)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @home = @seller.home.find(params[:id])
  		flash[:success] = "Home has been updated."
  		redirect_to seller_homes_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@home.destroy
  	flash[:success] = "Home has been destroyed."
  	redirect_to seller_homes_path
  end

  private

  	def home_params
  		params.require(:home).permit(:price, :square_feet, :bathroom, :room, :year_built, :sold)
  	end

  	def home
  		@home = Home.find(params[:id])
  	end

  	def seller
  		@seller = Seller.find(params[:seller_id])
  	end
end
