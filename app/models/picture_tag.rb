class PictureTag < ApplicationRecord
  
  belongs_to :tag
  belongs_to :picture
end
