class AddGifToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :gif, :string
  end
end
