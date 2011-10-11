require 'test_helper'

class ContainerContentsControllerTest < ActionController::TestCase
  setup do
    @container_content = container_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:container_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create container_content" do
    assert_difference('ContainerContent.count') do
      post :create, :container_content => @container_content.attributes
    end

    assert_redirected_to container_content_path(assigns(:container_content))
  end

  test "should show container_content" do
    get :show, :id => @container_content.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @container_content.to_param
    assert_response :success
  end

  test "should update container_content" do
    put :update, :id => @container_content.to_param, :container_content => @container_content.attributes
    assert_redirected_to container_content_path(assigns(:container_content))
  end

  test "should destroy container_content" do
    assert_difference('ContainerContent.count', -1) do
      delete :destroy, :id => @container_content.to_param
    end

    assert_redirected_to container_contents_path
  end
end
