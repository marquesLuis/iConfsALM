require 'test_helper'

class PersonMailerTest < ActionMailer::TestCase
  test "send_code" do
    mail = PersonMailer.send_code
    assert_equal "Send code", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
