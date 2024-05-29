class Experience < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :time, presence: true
end
