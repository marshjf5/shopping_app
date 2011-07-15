require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get orders" do
    get :orders
    assert_response :success
  end

end
