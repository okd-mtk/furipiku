class Public::LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    current_customer.likes.find_or_create_by(picture_id: @picture.id)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    like = Like.find_by(id: params[:id])
    @picture = Picture.find(like.picture_id) if like
    like.destroy if like
    redirect_back(fallback_location: root_url)
  end
end
