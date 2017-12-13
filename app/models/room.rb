class Room < ApplicationRecord
  has_many :topics, dependent: :destroy
end
