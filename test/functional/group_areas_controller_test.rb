require 'test_helper'

class GroupAreasControllerTest < ActionController::TestCase
  setup do
    @group_area = group_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_area" do
    assert_difference('GroupArea.count') do
      post :create, group_area: { area_of_interest_id: @group_area.area_of_interest_id, event_group_id: @group_area.event_group_id }
    end

    assert_redirected_to group_area_path(assigns(:group_area))
  end

  test "should show group_area" do
    get :show, id: @group_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_area
    assert_response :success
  end

  test "should update group_area" do
    put :update, id: @group_area, group_area: { area_of_interest_id: @group_area.area_of_interest_id, event_group_id: @group_area.event_group_id }
    assert_redirected_to group_area_path(assigns(:group_area))
  end

  test "should destroy group_area" do
    assert_difference('GroupArea.count', -1) do
      delete :destroy, id: @group_area
    end

    assert_redirected_to group_areas_path
  end
end
