class CreateSenders < ActiveRecord::Migration[5.1]
  def change
    create_table :senders do |t|
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip

      t.timestamps
    end
  end
end
