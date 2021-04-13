class Category < ApplicationRecord
    belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'
    has_many :children_categories, class_name: "Category", foreign_key: "category_id"

    has_many :product_categories
    has_many :products, through: :product_categories

    validates :name, presence: true
end
