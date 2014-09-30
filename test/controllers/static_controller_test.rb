require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get admin" do
    get :admin
    assert_response :success
  end
end
