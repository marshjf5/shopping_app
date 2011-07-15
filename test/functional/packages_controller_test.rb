require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  test "should get packages" do
    get :packages
    assert_response :success
  end

end
