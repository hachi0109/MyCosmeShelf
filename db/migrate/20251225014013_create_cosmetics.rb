class CreateCosmetics < ActiveRecord::Migration[7.1]
  def change
    create_table :cosmetics do |t|
      t.string :name, null: false
      t.integer :price
      t.string :brand
      t.integer :genre_id, null: false
      t.integer :color_id
      t.integer :usage_count_id, null: false
      t.date :purchase_date
      t.date :open_date
      t.integer :stock, null: false
      t.text :official_url
      t.boolean :is_favorite, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
