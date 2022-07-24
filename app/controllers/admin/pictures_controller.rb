class Admin::PicturesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @customer = @picture.customer
    @pictures = @customer.pictures
  end

  def destroy
  end

  private

  def admin_customer_params
    params.require(:customer).permit(:name, :email, :profile_image)
  end
end
