require 'test_helper'

class ProgramVersionsControllerTest < ActionController::TestCase
  setup do
    @program_version = program_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_version" do
    assert_difference('ProgramVersion.count') do
      post :create, program_version: { version: @program_version.version }
    end

    assert_redirected_to program_version_path(assigns(:program_version))
  end

  test "should show program_version" do
    get :show, id: @program_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_version
    assert_response :success
  end

  test "should update program_version" do
    put :update, id: @program_version, program_version: { version: @program_version.version }
    assert_redirected_to program_version_path(assigns(:program_version))
  end

  test "should destroy program_version" do
    assert_difference('ProgramVersion.count', -1) do
      delete :destroy, id: @program_version
    end

    assert_redirected_to program_versions_path
  end
end
