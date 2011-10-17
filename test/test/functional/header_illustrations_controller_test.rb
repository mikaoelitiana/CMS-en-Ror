require 'test_helper'

class HeaderIllustrationsControllerTest < ActionController::TestCase
  setup do
    @header_illustration = header_illustrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:header_illustrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create header_illustration" do
    assert_difference('HeaderIllustration.count') do
      post :create, :header_illustration => @header_illustration.attributes
    end

    assert_redirected_to header_illustration_path(assigns(:header_illustration))
  end

  test "should show header_illustration" do
    get :show, :id => @header_illustration.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @header_illustration.to_param
    assert_response :success
  end

  test "should update header_illustration" do
    put :update, :id => @header_illustration.to_param, :header_illustration => @header_illustration.attributes
    assert_redirected_to header_illustration_path(assigns(:header_illustration))
  end

  test "should destroy header_illustration" do
    assert_difference('HeaderIllustration.count', -1) do
      delete :destroy, :id => @header_illustration.to_param
    end

    assert_redirected_to header_illustrations_path
  end
end
