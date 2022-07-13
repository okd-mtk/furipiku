class Public::CustomersController < ApplicationController

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
  if @customer == current_customer
    render :edit
  else
    redirect_to public_customer_path(current_customer.id)
  end
end

def update
  @customer = Customer.find(params[:id])
  @customer = @customer.update(public_customer_params)
  redirect_to public_customer_path(current_customer.id)
end

def withdrawal
  @customer = Customer.find(params[:id])
  @customer.update(is_deleted: true)
  reset_session
  redirect_to root_path
end

def unsubscribe
end

private

def public_customer_params
    params.require(:customer).permit(:name, :email, :image)
end

end