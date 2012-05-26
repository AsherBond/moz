require 'test_helper'

class YoutubesControllerTest < ActionController::TestCase
  setup do
    @youtube = youtubes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:youtubes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create youtube" do
    assert_difference('Youtube.count') do
      post :create, youtube: { about: @youtube.about, title: @youtube.title, youtube_url: @youtube.youtube_url }
    end

    assert_redirected_to youtube_path(assigns(:youtube))
  end

  test "should show youtube" do
    get :show, id: @youtube
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @youtube
    assert_response :success
  end

  test "should update youtube" do
    put :update, id: @youtube, youtube: { about: @youtube.about, title: @youtube.title, youtube_url: @youtube.youtube_url }
    assert_redirected_to youtube_path(assigns(:youtube))
  end

  test "should destroy youtube" do
    assert_difference('Youtube.count', -1) do
      delete :destroy, id: @youtube
    end

    assert_redirected_to youtubes_path
  end
end
