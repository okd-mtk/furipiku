class Public::RelationshipsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(@customer)
  end

  def destroy
    @customer = Customer.find_by(params[:customer_id])
    current_customer.unfollow(@customer)
  end
end
