class AddProductIdToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :product_id, :integer
  end
end
