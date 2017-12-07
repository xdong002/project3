class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :owner_id
      t.string :owner_name
      t.belongs_to :user, foreign_key: true
      t.belongs_to :topic, foreign_key: true

      t.timestamps
    end
  end
end
