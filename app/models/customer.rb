class Customer < ApplicationRecord
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :pictures,     dependent: :destroy
  has_many :comments,     dependent: :destroy
  has_many :likes,        dependent: :destroy
  has_many :bookmarks,    dependent: :destroy
  has_many :comments,     dependent: :destroy
  has_many :tags,         dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  #ユーザーをフォロー
  def follow(other_customer)
    active_relationships.create(follow_id: other_customer.id)
  end

  #フォローを外す
  def unfollow(other_customer)
    active_relationships.find_by(follow_id: other_customer.id).destroy
  end

  #現在のユーザーがフォローしてたらtrueを返す
  def follow?(other_customer)
    follow.include?(other_customer)
  end
end
