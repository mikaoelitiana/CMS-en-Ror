require 'test_helper'

class FreeContentsControllerTest < ActionController::TestCase
  setup do
    @free_content = free_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:free_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create free_content" do
    assert_difference('FreeContent.count') do
      post :create, :free_content => @free_content.attributes
    end

    assert_redirected_to free_content_path(assigns(:free_content))
  end

  test "should show free_content" do
    get :show, :id => @free_content.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @free_content.to_param
    assert_response :success
  end

  test "should update free_content" do
    put :update, :id => @free_content.to_param, :free_content => @free_content.attributes
    assert_redirected_to free_content_path(assigns(:free_content))
  end

  test "should destroy free_content" do
    assert_difference('FreeContent.count', -1) do
      delete :destroy, :id => @free_content.to_param
    end

    assert_redirected_to free_contents_path
  end
end
