require 'test_helper'

class UpdateControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
