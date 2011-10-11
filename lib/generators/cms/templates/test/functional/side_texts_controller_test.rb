require 'test_helper'

class SideTextsControllerTest < ActionController::TestCase
  setup do
    @side_text = side_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:side_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create side_text" do
    assert_difference('SideText.count') do
      post :create, :side_text => @side_text.attributes
    end

    assert_redirected_to side_text_path(assigns(:side_text))
  end

  test "should show side_text" do
    get :show, :id => @side_text.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @side_text.to_param
    assert_response :success
  end

  test "should update side_text" do
    put :update, :id => @side_text.to_param, :side_text => @side_text.attributes
    assert_redirected_to side_text_path(assigns(:side_text))
  end

  test "should destroy side_text" do
    assert_difference('SideText.count', -1) do
      delete :destroy, :id => @side_text.to_param
    end

    assert_redirected_to side_texts_path
  end
end
