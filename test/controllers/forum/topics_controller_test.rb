require 'test_helper'

class Forum::TopicsControllerTest < ActionController::TestCase
  setup do
    @forum_topic = forum_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_topic" do
    assert_difference('Forum::Topic.count') do
      post :create, forum_topic: { title: @forum_topic.title }
    end

    assert_redirected_to forum_topic_path(assigns(:forum_topic))
  end

  test "should show forum_topic" do
    get :show, id: @forum_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_topic
    assert_response :success
  end

  test "should update forum_topic" do
    patch :update, id: @forum_topic, forum_topic: { title: @forum_topic.title }
    assert_redirected_to forum_topic_path(assigns(:forum_topic))
  end

  test "should destroy forum_topic" do
    assert_difference('Forum::Topic.count', -1) do
      delete :destroy, id: @forum_topic
    end

    assert_redirected_to forum_topics_path
  end
end
