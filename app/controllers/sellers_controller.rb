class SellersController < ApplicationController
	before_action :seller, except: [:index, :new, :create]
	before_action :options, only: [:new, :edit]
  def index
  	@sellers = Seller.all
  end

  def show
  end

  def new
  	@seller = Seller.new
  	
  end

  def create
  	@seller = Seller.new(seller_params)
  	if @seller.save
  		flash[:success] = "Real Estate Agent: #{@seller.name} has been created."
  		redirect_to sellers_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @seller.update(seller_params)
  		flash[:success] = "Real Estate Agent: #{@seller.name} has been updated."
  		redirect_to seller_path(@seller)
  	else
  		render :edit
  	end
  end

  def destroy
  	seller_name = @seller.name
  	@seller.destroy
  	flash[:success] = "Real Estate Agent #{@seller_name} has been deleted."
  	redirect_to sellers_path
  end

  private

  	def seller_params
  		params.require(:seller).permit(:name, :phone_number, :customer_rating)
  	end

  	def seller
  		@seller = Seller.find(params[:id])
  	end

  	def options
  		@options = [['One Star', 1], ['Two Star', 2], ['Three Star', 3], ['Four Star', 4], ['Five Star', 5]]
  	end
end
