require 'test_helper'

class EventDocumentsControllerTest < ActionController::TestCase
  setup do
    @event_document = event_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_document" do
    assert_difference('EventDocument.count') do
      post :create, event_document: { document_id: @event_document.document_id, event_id: @event_document.event_id }
    end

    assert_redirected_to event_document_path(assigns(:event_document))
  end

  test "should show event_document" do
    get :show, id: @event_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_document
    assert_response :success
  end

  test "should update event_document" do
    put :update, id: @event_document, event_document: { document_id: @event_document.document_id, event_id: @event_document.event_id }
    assert_redirected_to event_document_path(assigns(:event_document))
  end

  test "should destroy event_document" do
    assert_difference('EventDocument.count', -1) do
      delete :destroy, id: @event_document
    end

    assert_redirected_to event_documents_path
  end
end
