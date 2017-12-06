class Addtitle < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :title, :string
  end
end
