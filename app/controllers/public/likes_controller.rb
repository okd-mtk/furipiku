class Public::LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    current_customer.likes.find_or_create_by(picture_id: @picture.id)
  end

  def destroy
    like = Like.find_by(id: params[:id])
    @picture = Picture.find(like.picture_id)
    like.destroy
  end
end
