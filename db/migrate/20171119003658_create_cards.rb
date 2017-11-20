class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :sender, foreign_key: true
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip
      t.text :comment

      t.timestamps
    end
  end
end
