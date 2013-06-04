require 'test_helper'

class RemovedEventsControllerTest < ActionController::TestCase
  setup do
    @removed_event = removed_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:removed_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create removed_event" do
    assert_difference('RemovedEvent.count') do
      post :create, removed_event: { event_identifier: @removed_event.event_identifier }
    end

    assert_redirected_to removed_event_path(assigns(:removed_event))
  end

  test "should show removed_event" do
    get :show, id: @removed_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @removed_event
    assert_response :success
  end

  test "should update removed_event" do
    put :update, id: @removed_event, removed_event: { event_identifier: @removed_event.event_identifier }
    assert_redirected_to removed_event_path(assigns(:removed_event))
  end

  test "should destroy removed_event" do
    assert_difference('RemovedEvent.count', -1) do
      delete :destroy, id: @removed_event
    end

    assert_redirected_to removed_events_path
  end
end
