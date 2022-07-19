class Public::BookmarksController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    current_customer.bookmarks.find_or_create_by(picture_id: @picture.id)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    bookmark = Bookmark.find_by(id: params[:id])
    @picture = Picture.find(bookmark.picture_id) if bookmark
    bookmark.destroy if bookmark
    redirect_back(fallback_location: root_url)
  end
end

