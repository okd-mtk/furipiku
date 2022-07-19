class Public::PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
    @customer = @picture.customer
    @pictures = @customer.pictures
    @picture_comment = Comment.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      @picture.save_tags(params[:picture][:tag])
      redirect_to pictures_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to pictures_path
  end

  def bookmarks
    @customer = Customer.find(params[:id])
    bookmarks = Bookmark.where(customer_id: @customer.id).pluck(:picture_id)
    @bookmarks_pictures = Picture.find(bookmarks)
  end

  private

  def picture_params
    params.require(:picture).permit(:tag, :explain, post_images: []).merge(customer_id: current_customer.id)
  end
end
