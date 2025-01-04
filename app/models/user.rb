class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :following, through: :followed_users

  has_many :following_users, foreign_key: :following_user_id, class_name: "Follow"
  has_many :followers, through: :following_users

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :post_comments, through: :posts, source: :comments  # Comments on user's posts
end
