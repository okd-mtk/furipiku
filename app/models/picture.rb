class Picture < ApplicationRecord
  has_one_attached :images
  
  belongs_to :customer
  has_many :comments
end
