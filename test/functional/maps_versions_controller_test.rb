require 'test_helper'

class MapsVersionsControllerTest < ActionController::TestCase
  setup do
    @maps_version = maps_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maps_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maps_version" do
    assert_difference('MapsVersion.count') do
      post :create, maps_version: { version: @maps_version.version }
    end

    assert_redirected_to maps_version_path(assigns(:maps_version))
  end

  test "should show maps_version" do
    get :show, id: @maps_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maps_version
    assert_response :success
  end

  test "should update maps_version" do
    put :update, id: @maps_version, maps_version: { version: @maps_version.version }
    assert_redirected_to maps_version_path(assigns(:maps_version))
  end

  test "should destroy maps_version" do
    assert_difference('MapsVersion.count', -1) do
      delete :destroy, id: @maps_version
    end

    assert_redirected_to maps_versions_path
  end
end
