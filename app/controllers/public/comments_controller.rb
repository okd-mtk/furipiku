class Public::CommentsController < ApplicationController
  
  def create
    picture = Picture.find(params[:picture_id])
    comment = current_customer.comments.new(comment_params)
    comment.picture_id = picture.id
    comment.save
    redirect_to pictures_path
  end
  
  def destroy
    #picture = Picture.find(params[:picture_id])
    comment = current_customer.comments.find_by(comment_params)
    comment.destroy
    redirect_to pictures_path
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:message)
  end
end
