class Public::CustomersController < ApplicationController

def show
  @customer = Customer.find(params[:id])
  @pictures = Picture.where(customer_id: @customer.id)
end

def edit
  @customer = Customer.find(params[:id])
  unless @customer == current_customer
    redirect_to public_customer_path(current_customer.id)
  end
  # redirect_to public_customer_path(current_customer.id) unless @customer == current_customer
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

def following
    @customer  = Customer.find(params[:id])
    @customers = @customer.followings
end

def followers
    @customer  = Customer.find(params[:id])
    @customers = @customer.followers
end

def likes
    @customer = Customer.find(params[:id])
    likes = Like.where(customer_id: @customer.id).pluck(:picture_id)
    @likes_pictures = Picture.find(likes)
end

def bookmarks
    @customer = Customer.find(params[:id])
    bookmarks = Bookmark.where(customer_id: @customer.id).pluck(:picture_id)
    @bookmarks_pictures = Picture.find(bookmarks)
end

def comments
    @customer = Customer.find(params[:id])
    comments = Comment.where(customer_id: @customer.id).pluck(:picture_id)
    @comments_pictures = Picture.find(comments)
end

private

def public_customer_params
    params.require(:customer).permit(:name, :email, :profile_image)
end

end