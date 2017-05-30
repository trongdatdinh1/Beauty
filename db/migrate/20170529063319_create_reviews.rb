class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :content
      t.integer :user_id
      t.integer :reviewed_id

      t.timestamps
    end
    add_index :reviews, [:user_id, :reviewed_id], unique: true
  end
end
