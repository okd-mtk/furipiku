class Relationship < ApplicationRecord
  belongs_to :customer
  belongs_to :follower, class_name: 'Customer'
end
