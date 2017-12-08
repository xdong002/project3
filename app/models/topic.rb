class Topic < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4, maximum: 30}
  validates :content, length: {maximum: 10000}
  belongs_to :user
  belongs_to :room
  has_many :comments, dependent: :destroy
end
