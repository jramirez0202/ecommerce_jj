class Payment < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :payment_method
  
end
