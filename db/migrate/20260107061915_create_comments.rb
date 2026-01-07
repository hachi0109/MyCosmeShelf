class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :cosmetic, null: false, foreign_key: true
      t.text :content
      t.integer :rating
      t.integer :status_id

      t.timestamps
    end
  end
end
