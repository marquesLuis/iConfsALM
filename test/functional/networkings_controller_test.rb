require 'test_helper'

class NetworkingsControllerTest < ActionController::TestCase
  setup do
    @networking = networkings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:networkings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create networking" do
    assert_difference('Networking.count') do
      post :create, networking: { content: @networking.content, person_id: @networking.person_id, title: @networking.title }
    end

    assert_redirected_to networking_path(assigns(:networking))
  end

  test "should show networking" do
    get :show, id: @networking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @networking
    assert_response :success
  end

  test "should update networking" do
    put :update, id: @networking, networking: { content: @networking.content, person_id: @networking.person_id, title: @networking.title }
    assert_redirected_to networking_path(assigns(:networking))
  end

  test "should destroy networking" do
    assert_difference('Networking.count', -1) do
      delete :destroy, id: @networking
    end

    assert_redirected_to networkings_path
  end
end
