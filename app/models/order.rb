class Order < ApplicationRecord
  before_create -> { generate_number(RANDOM_SIZE) }

  ORDER_PREFIX = 'PO'
  RANDOM_SIZE = 9

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_many :payments
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
    "#{ORDER_PREFIX}#{Array.new(size){rand(size)}.join}"
  end  
  
  def compra_total
    sum = 0
    order_items.each do |item|
      sum += item.price.to_i
    end
    update_attribute(:total, sum)
  end

  def add_product(product_id, quantity)
      product = Product.find(product_id)
      if product && product.stock > (0)
        order_items.create(product_id: product_id, quantity: quantity, price: product.price)  
        compra_total  
    end
  end
  

end
