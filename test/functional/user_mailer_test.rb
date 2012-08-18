require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  test "welcome" do
    mail = UserMailer.welcome(@user)
    assert_equal "[Footy Share Tipping] Welcome to the Footy Share Tipping website", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["michael.goodwin@anz.com"], mail.from
    assert_match "Thanks for signing up", mail.body.encoded
  end

end
