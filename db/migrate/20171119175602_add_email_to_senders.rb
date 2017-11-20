class AddEmailToSenders < ActiveRecord::Migration[5.1]
  def change
    add_column :senders, :email, :text
  end
end
