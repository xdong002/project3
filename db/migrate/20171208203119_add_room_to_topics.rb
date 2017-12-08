class AddRoomToTopics < ActiveRecord::Migration[5.1]
  def change
    add_reference :topics, :room, foreign_key: true
  end
end
