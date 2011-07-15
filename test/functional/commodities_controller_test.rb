require 'test_helper'

class CommoditiesControllerTest < ActionController::TestCase
  test "should get commodities" do
    get :commodities
    assert_response :success
  end

end
