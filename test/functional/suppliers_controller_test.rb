require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  test "should get suppliers" do
    get :suppliers
    assert_response :success
  end

end
