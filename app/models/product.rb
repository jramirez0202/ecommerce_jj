class Product < ApplicationRecord
    # has_and_belongs_to_many :categories

    has_many :product_categories
    has_many :categories, through: :product_categories

    has_many :product_categories
    has_many :categories, through: :product_categories
end
