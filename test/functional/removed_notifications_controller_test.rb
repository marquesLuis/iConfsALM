require 'test_helper'

class RemovedNotificationsControllerTest < ActionController::TestCase
  setup do
    @removed_notification = removed_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:removed_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create removed_notification" do
    assert_difference('RemovedNotification.count') do
      post :create, removed_notification: { sequence_number: @removed_notification.sequence_number }
    end

    assert_redirected_to removed_notification_path(assigns(:removed_notification))
  end

  test "should show removed_notification" do
    get :show, id: @removed_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @removed_notification
    assert_response :success
  end

  test "should update removed_notification" do
    put :update, id: @removed_notification, removed_notification: { sequence_number: @removed_notification.sequence_number }
    assert_redirected_to removed_notification_path(assigns(:removed_notification))
  end

  test "should destroy removed_notification" do
    assert_difference('RemovedNotification.count', -1) do
      delete :destroy, id: @removed_notification
    end

    assert_redirected_to removed_notifications_path
  end
end
