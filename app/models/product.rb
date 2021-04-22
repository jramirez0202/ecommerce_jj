class Product < ApplicationRecord
    # has_and_belongs_to_many :categories
    belongs_to :user
    
    has_many :product_categories
    has_many :categories, through: :product_categories , dependent: :destroy

    has_many :product_categories
    has_many :categories, through: :product_categories

    has_many :order_items
    has_many :orders, through: :order_items
end
