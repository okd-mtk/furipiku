class Public::BookmarksController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    current_customer.bookmarks.find_or_create_by(picture_id: @picture.id)
  end

  def destroy
    bookmark = Bookmark.find_by(id: params[:id])
    @picture = Picture.find(bookmark.picture_id) 
    bookmark.destroy 
  end
end

