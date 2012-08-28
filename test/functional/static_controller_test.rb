require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get invest" do
    get :invest
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
