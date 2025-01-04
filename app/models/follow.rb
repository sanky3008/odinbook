class Follow < ApplicationRecord
  belongs_to :follower_id, class_name: 'User'
  belongs_to :following_user_id, class_name: 'User'
end
