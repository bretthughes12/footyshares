require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signup" do
    assert_difference('User.count') do
      post :create, signup: { email: @user.email, 
                              name: @user.name, 
                              nickname: "bruce", 
                              starting_shares: @user.starting_shares, 
                              login: "bruce",
                              password: "secret",
                              password_confirmation: "secret" }
    end

    assert_redirected_to signup_path
  end

end
