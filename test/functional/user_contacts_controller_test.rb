require 'test_helper'

class UserContactsControllerTest < ActionController::TestCase
  test "should get send_request" do
    get :send_request
    assert_response :success
  end

end
