require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get adminhome" do
    get :adminhome
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
