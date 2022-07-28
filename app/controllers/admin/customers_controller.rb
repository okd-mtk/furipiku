class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def picutures
    
  end

  def update
    @customer = Customer.find(params[:id])
    @customer = @customer.update(admin_customer_params)
    redirect_to admin_customer_path(params[:id])
  end

  private

  def admin_customer_params
    params.require(:customer).permit(:name, :email, :profile_image)
  end

end
