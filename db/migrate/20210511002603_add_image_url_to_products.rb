class AddImageUrlToProducts < ActiveRecord::Migration[5.2]
  def change
    add_attachment :products, :image, :string
  end
end
