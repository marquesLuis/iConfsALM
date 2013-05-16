require 'test_helper'

class SingupControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get do" do
    get :do
    assert_response :success
  end

end
