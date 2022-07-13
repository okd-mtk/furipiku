class Picture < ApplicationRecord
  has_many_attached :image
  
  belongs_to :customer
  has_many :comments
  
  validates :image, presence: true
end
