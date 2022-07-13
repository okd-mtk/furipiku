class Public::PicturesController < ApplicationController
  
  def edit
  end
  
  def index
    @pictures = Picture.all
  end
  
  def new
  end
  
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end
  
  def show
  end
  
  private
  
  def picture_params
    params.require(:picture).permit(:name, :explain, image: [])
  end
end
