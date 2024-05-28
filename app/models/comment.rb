class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  validates :body, presence: true, length: { maximum: 100 }
end
