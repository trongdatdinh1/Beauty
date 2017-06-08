class AddPriceQuantityToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :price, :decimal, default: 0
    add_column :posts, :quantity, :integer, default: 1
  end
end
