class Tag < ApplicationRecord

  has_many :picture_tags, dependent: :destroy
  has_many :pictures, through: :picture_tags, dependent: :destroy
end
