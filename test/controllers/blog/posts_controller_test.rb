require 'test_helper'

class Blog::PostsControllerTest < ActionController::TestCase
  setup do
    @blog_post = blog_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_post" do
    assert_difference('Blog::Post.count') do
      post :create, blog_post: { body_html: @blog_post.body_html, body_markdown: @blog_post.body_markdown, draft: @blog_post.draft, published_on: @blog_post.published_on, title: @blog_post.title, user_id: @blog_post.user_id }
    end

    assert_redirected_to blog_post_path(assigns(:blog_post))
  end

  test "should show blog_post" do
    get :show, id: @blog_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_post
    assert_response :success
  end

  test "should update blog_post" do
    patch :update, id: @blog_post, blog_post: { body_html: @blog_post.body_html, body_markdown: @blog_post.body_markdown, draft: @blog_post.draft, published_on: @blog_post.published_on, title: @blog_post.title, user_id: @blog_post.user_id }
    assert_redirected_to blog_post_path(assigns(:blog_post))
  end

  test "should destroy blog_post" do
    assert_difference('Blog::Post.count', -1) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to blog_posts_path
  end
end
