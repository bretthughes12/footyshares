require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user = FactoryBot.create(:user)
  end

  def test_should_get_login
    get :new
    assert_response :success
    assert_template 'new'
  end

  def test_should_login_non_admin_user
    post :create, params: { login: @user.login, password: @user.password }
    assert_not_nil session[:user_id]
    assert_equal @user.id, session[:user_id]
    assert_redirected_to root_path
  end

  def test_should_not_login_with_bad_password
    post :create, params: { login: @user.login, password: "notsosecret" }
#    assert_select "div#main" do
#      assert_select "div.notification", "Invalid user/password combination"
#    end
    assert_nil session[:user_id]
    assert_redirected_to login_url
#    assert_tag :div, :attributes => { :id => 'notice' }
  end

  def test_should_logout
    delete :destroy, session: { user_id: @user.id}
                   
    assert_nil session[:user_id]
    assert_redirected_to root_url
    assert_equal "Logged out", flash[:notice]
  end

  def test_should_logout_even_when_not_logged_on
    delete :destroy
                   
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end
end
