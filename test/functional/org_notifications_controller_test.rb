require 'test_helper'

class OrgNotificationsControllerTest < ActionController::TestCase
  setup do
    @org_notification = org_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_notification" do
    assert_difference('OrgNotification.count') do
      post :create, org_notification: { content: @org_notification.content, title: @org_notification.title }
    end

    assert_redirected_to org_notification_path(assigns(:org_notification))
  end

  test "should show org_notification" do
    get :show, id: @org_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_notification
    assert_response :success
  end

  test "should update org_notification" do
    put :update, id: @org_notification, org_notification: { content: @org_notification.content, title: @org_notification.title }
    assert_redirected_to org_notification_path(assigns(:org_notification))
  end

  test "should destroy org_notification" do
    assert_difference('OrgNotification.count', -1) do
      delete :destroy, id: @org_notification
    end

    assert_redirected_to org_notifications_path
  end
end
