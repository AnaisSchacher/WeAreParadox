class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :video_id, presence: true
  validates :category, presence: true
end
