require 'test_helper'

class LibraryCategoriesControllerTest < ActionController::TestCase
  setup do
    @library_category = library_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:library_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create library_category" do
    assert_difference('LibraryCategory.count') do
      post :create, library_category: { title: @library_category.title }
    end

    assert_redirected_to library_category_path(assigns(:library_category))
  end

  test "should show library_category" do
    get :show, id: @library_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @library_category
    assert_response :success
  end

  test "should update library_category" do
    patch :update, id: @library_category, library_category: { title: @library_category.title }
    assert_redirected_to library_category_path(assigns(:library_category))
  end

  test "should destroy library_category" do
    assert_difference('LibraryCategory.count', -1) do
      delete :destroy, id: @library_category
    end

    assert_redirected_to library_categories_path
  end
end
