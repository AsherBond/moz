require 'test_helper'

class PtracksControllerTest < ActionController::TestCase
  setup do
    @ptrack = ptracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ptracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ptrack" do
    assert_difference('Ptrack.count') do
      post :create, ptrack: { song_id: @ptrack.song_id }
    end

    assert_redirected_to ptrack_path(assigns(:ptrack))
  end

  test "should show ptrack" do
    get :show, id: @ptrack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ptrack
    assert_response :success
  end

  test "should update ptrack" do
    put :update, id: @ptrack, ptrack: { song_id: @ptrack.song_id }
    assert_redirected_to ptrack_path(assigns(:ptrack))
  end

  test "should destroy ptrack" do
    assert_difference('Ptrack.count', -1) do
      delete :destroy, id: @ptrack
    end

    assert_redirected_to ptracks_path
  end
end
