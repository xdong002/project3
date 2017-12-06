class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :owner_id
      t.string :owner_name
      t.text :content

      t.timestamps
    end
  end
end
