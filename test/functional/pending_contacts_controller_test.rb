require 'test_helper'

class PendingContactsControllerTest < ActionController::TestCase
  setup do
    @pending_contact = pending_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_contact" do
    assert_difference('PendingContact.count') do
      post :create, pending_contact: { requested_id: @pending_contact.requested_id, requester_id: @pending_contact.requester_id }
    end

    assert_redirected_to pending_contact_path(assigns(:pending_contact))
  end

  test "should show pending_contact" do
    get :show, id: @pending_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending_contact
    assert_response :success
  end

  test "should update pending_contact" do
    put :update, id: @pending_contact, pending_contact: { requested_id: @pending_contact.requested_id, requester_id: @pending_contact.requester_id }
    assert_redirected_to pending_contact_path(assigns(:pending_contact))
  end

  test "should destroy pending_contact" do
    assert_difference('PendingContact.count', -1) do
      delete :destroy, id: @pending_contact
    end

    assert_redirected_to pending_contacts_path
  end
end
