require 'test_helper'

class AreaOfInterestsControllerTest < ActionController::TestCase
  setup do
    @area_of_interest = area_of_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_of_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_of_interest" do
    assert_difference('AreaOfInterest.count') do
      post :create, area_of_interest: { name: @area_of_interest.name }
    end

    assert_redirected_to area_of_interest_path(assigns(:area_of_interest))
  end

  test "should show area_of_interest" do
    get :show, id: @area_of_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_of_interest
    assert_response :success
  end

  test "should update area_of_interest" do
    put :update, id: @area_of_interest, area_of_interest: { name: @area_of_interest.name }
    assert_redirected_to area_of_interest_path(assigns(:area_of_interest))
  end

  test "should destroy area_of_interest" do
    assert_difference('AreaOfInterest.count', -1) do
      delete :destroy, id: @area_of_interest
    end

    assert_redirected_to area_of_interests_path
  end
end
