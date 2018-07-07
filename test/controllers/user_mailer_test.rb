require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = FactoryBot.create(:user)
  end

  test "welcome" do
    mail = UserMailer.welcome(@user)
    assert_equal "[AFL Finals Sharemarket] Welcome to the AFL Finals Sharemarket website", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["michael.goodwin@anz.com"], mail.from
    assert_match "Thanks for signing up", mail.body.encoded
  end

end
