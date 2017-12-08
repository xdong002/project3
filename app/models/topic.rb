class Topic < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4, maximum: 25}
  validates :content, presence: true, length: {maximum: 1000}
  belongs_to :user
  has_many :comments, dependent: :destroy
end
