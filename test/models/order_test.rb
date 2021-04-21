require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'generates a  randon number on create' do
    user = users(:one)
    order = Order.create(user_id: user.id)

    assert_not order.number.nil?
  end
end
