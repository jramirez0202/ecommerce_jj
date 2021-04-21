class Order < ApplicationRecord
  belongs_to :user
  # before_create :generate_number

  # def generate_number
  #   self.number = loop do
  #     rand_string = "PO#{Array.new(9){rand(9)}.split}"
  #     break rand_string unless Order.exists?(number: rand_string)
  #   end
  # end
end
