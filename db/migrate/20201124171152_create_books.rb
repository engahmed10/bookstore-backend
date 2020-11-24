class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image
      t.integer :isbn
      t.string :price
      t.string :authors
      t.string :year
      t.integer :user_id

      t.timestamps
    end
  end
end
