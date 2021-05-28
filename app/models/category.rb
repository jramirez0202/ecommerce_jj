class Category < ApplicationRecord
	has_one_attached :photo do |attachable|
		attachable.variant :thumb, resize: "100x100"
	end

validates :name, :photo, presence: true

# # Tiene un archivo adjunto llamado cover con dos versiones de tamaño
# has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" },
# :default_url => "/image/:thumb/missing.png"

# # Validación para evitar ataques y solo se suban los archivos de unas extensiones predefinidas
# validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/ 

has_and_belongs_to_many :products, dependent: :destroy



	def children
		Category.where(category_id: self.id)
	end

	def family
		family = []
		children1 = self.children
		children1.each do |c|
			family.push c
			x = c.children
			if x.count > 0
				family.push x
		end
		end
		family
	end

		def offspring(offsprings = nil)
			# ||=[] crea un arreglo vacio opcional
			offsprings ||= []
			childrens = Category.where(category_id: self.id)
			childrens.each do |child|
			offsprings << {id: child.id , name: child.name}
			child.offspring(offsprings)
			end
			offsprings
		end 
			# belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id', dependent: :destroy
			# has_many :children_categories, class_name: "Category", foreign_key: "category_id"

			# has_many :product_categories, dependent: :destroy
			# has_many :products, through: :product_categories

end
