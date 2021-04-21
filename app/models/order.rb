class Order < ApplicationRecord
  ORDER_PREFIX = 'PO'
  RANDOM_SIZE = 9
  belongs_to :user
  before_create -> { generate_number(RANDOM_SIZE) }

  has_many :order_items
  has_many :products, through: :order_items

  #validamos que el numero de orden no se repita
  validates :number, uniqueness: true

  #generar un numero de orden
  def generate_number(size)
    self.number = loop do
      rand_string = random_candidate(size)
      break rand_string unless Order.exists?(number: rand_string)
    end
  end

  #El numero debe ser aleatorio
  def random_candidate(size)
    "#{ORDER_PREFIX}#{Array.new(size){rand(size)}.split}"
  end

  def add_product(product_id, quantity)
      product = Product.find(product_id)
      if product && product.stock > 0
        order_items.create(product_id: product_id, quantity: quantity, price: product.price)    
    end
  end
  
end
