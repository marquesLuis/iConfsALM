require 'test_helper'

class PersonInterestsControllerTest < ActionController::TestCase
  setup do
    @person_interest = person_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_interest" do
    assert_difference('PersonInterest.count') do
      post :create, person_interest: { area_interest_id: @person_interest.area_interest_id, person_id: @person_interest.person_id }
    end

    assert_redirected_to person_interest_path(assigns(:person_interest))
  end

  test "should show person_interest" do
    get :show, id: @person_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_interest
    assert_response :success
  end

  test "should update person_interest" do
    put :update, id: @person_interest, person_interest: { area_interest_id: @person_interest.area_interest_id, person_id: @person_interest.person_id }
    assert_redirected_to person_interest_path(assigns(:person_interest))
  end

  test "should destroy person_interest" do
    assert_difference('PersonInterest.count', -1) do
      delete :destroy, id: @person_interest
    end

    assert_redirected_to person_interests_path
  end
end
