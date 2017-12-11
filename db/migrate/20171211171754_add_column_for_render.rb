class AddColumnForRender < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender_show, :string
    add_column :messages, :receiver_show, :string
  end
end
