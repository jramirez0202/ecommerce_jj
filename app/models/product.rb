class Product < ApplicationRecord

    validates :name, :sku, :stock, :description, :price, presence: true

    has_and_belongs_to_many :categories
    belongs_to :user, optional: true
	has_many :scores
    has_many :order_items, dependent: :destroy
    has_many :orders, through: :order_items

	# Tiene un archivo adjunto llamado cover con dos versiones de tamaño
has_attached_file :image, 
styles: { medium: "300x300>", thumb: "100x100>" },
:default_url => "/image/:thumb/missing.png"

# Validación para evitar ataques y solo se suban los archivos de unas extensiones predefinidas
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ 



end

