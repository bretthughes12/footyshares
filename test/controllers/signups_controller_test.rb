require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @round = FactoryBot.create(:round)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should allow signup" do
    assert_difference('User.count') do
      post :create, params: {signup: { email: @user.email, 
                                      name: "Bruce", 
                                      nickname: "bruce", 
                                      starting_shares: @user.starting_shares, 
                                      login: "bruce",
                                      password: "secret",
                                      password_confirmation: "secret" }}
    end

    assert_redirected_to root_path
  end

  test "should not allow signup if user invalid" do
    assert_no_difference('User.count') do
      post :create, params: {signup: { email: "invalid", 
                                       name: "Bruce", 
                                       nickname: "bruce", 
                                       starting_shares: @user.starting_shares, 
                                       login: "bruce",
                                       password: "secret",
                                       password_confirmation: "secret" }}
    end

    assert_response :success
    assert_template :new
  end

  test "should not allow signup if competition has already started" do
    Round.delete_all
    @round = FactoryBot.create(:round, cutoff_at: 5.minutes.ago)
 
    assert_no_difference('User.count') do
      post :create, params: {signup: { email: @user.email, 
                                       name: "Bruce", 
                                       nickname: "bruce", 
                                       starting_shares: @user.starting_shares, 
                                       login: "bruce",
                                       password: "secret",
                                       password_confirmation: "secret" }}
    end

    assert_response :success
    assert_template :new
  end
end
