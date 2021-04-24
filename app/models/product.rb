class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    belongs_to :user, optional: true
    
    # has_many :product_categories
    # has_many :categories, through: :product_categories , dependent: :destroy

    # has_many :product_categories
    # has_many :categories, through: :product_categories

		# has_many :products_variants
		# has_many :variants, through: :products_variants

    has_many :order_items
    has_many :orders, through: :order_items



    # def self.catalogo
		# 	products = Product.all
		# 	catalogo = []
		# 	products.each do |product|    
		# 	suma = product.products_variants.map{|x| x.stock}.sum
		# 	if suma > 0
		# 		catalogo << product
		# 	end
		# end
		# catalogo
		# end
end

