require 'test_helper'

class TradedContactsControllerTest < ActionController::TestCase
  setup do
    @traded_contact = traded_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traded_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traded_contact" do
    assert_difference('TradedContact.count') do
      post :create, traded_contact: { requested_id: @traded_contact.requested_id, requester_id: @traded_contact.requester_id }
    end

    assert_redirected_to traded_contact_path(assigns(:traded_contact))
  end

  test "should show traded_contact" do
    get :show, id: @traded_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traded_contact
    assert_response :success
  end

  test "should update traded_contact" do
    put :update, id: @traded_contact, traded_contact: { requested_id: @traded_contact.requested_id, requester_id: @traded_contact.requester_id }
    assert_redirected_to traded_contact_path(assigns(:traded_contact))
  end

  test "should destroy traded_contact" do
    assert_difference('TradedContact.count', -1) do
      delete :destroy, id: @traded_contact
    end

    assert_redirected_to traded_contacts_path
  end
end
