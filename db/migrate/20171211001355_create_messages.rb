class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender_name
      t.string :receiver_name
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
