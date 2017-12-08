class Comment < ApplicationRecord
  validates :content, presence: true, length: {maximum: 5000}
  belongs_to :user
  belongs_to :topic
end
