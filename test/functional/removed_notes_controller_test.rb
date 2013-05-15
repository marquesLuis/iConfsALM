require 'test_helper'

class RemovedNotesControllerTest < ActionController::TestCase
  setup do
    @removed_note = removed_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:removed_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create removed_note" do
    assert_difference('RemovedNote.count') do
      post :create, removed_note: { person_id: @removed_note.person_id, sequence_number: @removed_note.sequence_number }
    end

    assert_redirected_to removed_note_path(assigns(:removed_note))
  end

  test "should show removed_note" do
    get :show, id: @removed_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @removed_note
    assert_response :success
  end

  test "should update removed_note" do
    put :update, id: @removed_note, removed_note: { person_id: @removed_note.person_id, sequence_number: @removed_note.sequence_number }
    assert_redirected_to removed_note_path(assigns(:removed_note))
  end

  test "should destroy removed_note" do
    assert_difference('RemovedNote.count', -1) do
      delete :destroy, id: @removed_note
    end

    assert_redirected_to removed_notes_path
  end
end
