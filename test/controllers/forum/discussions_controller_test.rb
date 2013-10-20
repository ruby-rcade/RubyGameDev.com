require 'test_helper'

class Forum::DiscussionsControllerTest < ActionController::TestCase
  setup do
    @forum_discussion = forum_discussions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_discussions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_discussion" do
    assert_difference('Forum::Discussion.count') do
      post :create, forum_discussion: { body: @forum_discussion.body, title: @forum_discussion.title, topic_id: @forum_discussion.topic_id, user_id: @forum_discussion.user_id }
    end

    assert_redirected_to forum_discussion_path(assigns(:forum_discussion))
  end

  test "should show forum_discussion" do
    get :show, id: @forum_discussion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_discussion
    assert_response :success
  end

  test "should update forum_discussion" do
    patch :update, id: @forum_discussion, forum_discussion: { body: @forum_discussion.body, title: @forum_discussion.title, topic_id: @forum_discussion.topic_id, user_id: @forum_discussion.user_id }
    assert_redirected_to forum_discussion_path(assigns(:forum_discussion))
  end

  test "should destroy forum_discussion" do
    assert_difference('Forum::Discussion.count', -1) do
      delete :destroy, id: @forum_discussion
    end

    assert_redirected_to forum_discussions_path
  end
end
