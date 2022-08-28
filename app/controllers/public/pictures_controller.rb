class Public::PicturesController < ApplicationController

  def show
  end

  def index
    @picture_comment = Comment.new
    if params[:keyword].present?
      keyword = ApplicationRecord.sanitize_sql_like(params[:keyword])
      @pictures = Picture.joins(:tags).where("pictures.explain LIKE ? OR tags.name LIKE ?", "%#{keyword}%", "%#{keyword}%").distinct
    else
      @pictures = Picture.all
    end
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      @picture.save_tags(params[:picture][:tag])
      @picture.post_images.each do |post_image|
        tags = Vision.get_image_data(post_image)
        tags.each do |tag|
          @picture.tags.create(name: tag, cloud: 1)
        end
      end
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
    if customer_signed_in?
      redirect_to pictures_path
    elsif admin_signed_in?
      redirect_to admin_pictures_path
    end
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
