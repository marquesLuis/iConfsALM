require 'test_helper'

class RejectedContactsControllerTest < ActionController::TestCase
  setup do
    @rejected_contact = rejected_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rejected_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rejected_contact" do
    assert_difference('RejectedContact.count') do
      post :create, rejected_contact: { requested_id: @rejected_contact.requested_id, requester_id: @rejected_contact.requester_id }
    end

    assert_redirected_to rejected_contact_path(assigns(:rejected_contact))
  end

  test "should show rejected_contact" do
    get :show, id: @rejected_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rejected_contact
    assert_response :success
  end

  test "should update rejected_contact" do
    put :update, id: @rejected_contact, rejected_contact: { requested_id: @rejected_contact.requested_id, requester_id: @rejected_contact.requester_id }
    assert_redirected_to rejected_contact_path(assigns(:rejected_contact))
  end

  test "should destroy rejected_contact" do
    assert_difference('RejectedContact.count', -1) do
      delete :destroy, id: @rejected_contact
    end

    assert_redirected_to rejected_contacts_path
  end
end
