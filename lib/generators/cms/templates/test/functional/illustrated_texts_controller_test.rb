require 'test_helper'

class IllustratedTextsControllerTest < ActionController::TestCase
  setup do
    @illustrated_text = illustrated_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:illustrated_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create illustrated_text" do
    assert_difference('IllustratedText.count') do
      post :create, :illustrated_text => @illustrated_text.attributes
    end

    assert_redirected_to illustrated_text_path(assigns(:illustrated_text))
  end

  test "should show illustrated_text" do
    get :show, :id => @illustrated_text.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @illustrated_text.to_param
    assert_response :success
  end

  test "should update illustrated_text" do
    put :update, :id => @illustrated_text.to_param, :illustrated_text => @illustrated_text.attributes
    assert_redirected_to illustrated_text_path(assigns(:illustrated_text))
  end

  test "should destroy illustrated_text" do
    assert_difference('IllustratedText.count', -1) do
      delete :destroy, :id => @illustrated_text.to_param
    end

    assert_redirected_to illustrated_texts_path
  end
end
