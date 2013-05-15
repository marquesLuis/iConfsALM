require 'test_helper'

class SessionGroupsControllerTest < ActionController::TestCase
  setup do
    @session_group = session_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_group" do
    assert_difference('SessionGroup.count') do
      post :create, session_group: { date: @session_group.date, duration: @session_group.duration }
    end

    assert_redirected_to session_group_path(assigns(:session_group))
  end

  test "should show session_group" do
    get :show, id: @session_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_group
    assert_response :success
  end

  test "should update session_group" do
    put :update, id: @session_group, session_group: { date: @session_group.date, duration: @session_group.duration }
    assert_redirected_to session_group_path(assigns(:session_group))
  end

  test "should destroy session_group" do
    assert_difference('SessionGroup.count', -1) do
      delete :destroy, id: @session_group
    end

    assert_redirected_to session_groups_path
  end
end
