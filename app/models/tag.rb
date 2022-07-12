class Tag < ApplicationRecord

  belongs_to :customer
  has_many :pictures
end
