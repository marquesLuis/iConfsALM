require 'test_helper'

class UserProgramControllerTest < ActionController::TestCase
  test "should get show_complete" do
    get :show_complete
    assert_response :success
  end

end
