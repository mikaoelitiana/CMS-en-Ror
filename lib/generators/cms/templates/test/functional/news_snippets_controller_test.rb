require 'test_helper'

class NewsSnippetsControllerTest < ActionController::TestCase
  setup do
    @news_snippet = news_snippets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_snippets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_snippet" do
    assert_difference('NewsSnippet.count') do
      post :create, :news_snippet => @news_snippet.attributes
    end

    assert_redirected_to news_snippet_path(assigns(:news_snippet))
  end

  test "should show news_snippet" do
    get :show, :id => @news_snippet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @news_snippet.to_param
    assert_response :success
  end

  test "should update news_snippet" do
    put :update, :id => @news_snippet.to_param, :news_snippet => @news_snippet.attributes
    assert_redirected_to news_snippet_path(assigns(:news_snippet))
  end

  test "should destroy news_snippet" do
    assert_difference('NewsSnippet.count', -1) do
      delete :destroy, :id => @news_snippet.to_param
    end

    assert_redirected_to news_snippets_path
  end
end
