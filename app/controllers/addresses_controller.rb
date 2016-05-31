class AddressesController < ApplicationController
  before_action :seller 
  before_action :home
  before_action :address, except: [:index, :create, :new]

  def index
    @addresses = @home.address
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = @home.create_address(address_params)
    if @address.save
      flash[:success] = "Address saved."
      redirect_to seller_home_address_path(@seller, @home, @address)
    else
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      flash[:success] = "Address has been updated."
      redirect_to seller_home_addresses_path(@seller, @home)
    else
      render :edit
    end
  end

  def destroy
    address_street_name = @address.street_name
    @address.destroy
    flash[:success] = "Address has been deleted."
    redirect_to seller_home_addresses_path(@seller, @home)
  end

  private

    def address
      @address = Address.find(params[:id])
    end

  	def address_params
      params.require(:address).permit(:street_name, :city, :state)
  	end

    def home
      @home = Home.find(params[:home_id])
    end

  	def seller
      @seller = Seller.find(params[:seller_id])
  	end
end
