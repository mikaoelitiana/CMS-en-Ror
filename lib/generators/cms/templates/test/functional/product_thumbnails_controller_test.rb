require 'test_helper'

class ProductThumbnailsControllerTest < ActionController::TestCase
  setup do
    @product_thumbnail = product_thumbnails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_thumbnails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_thumbnail" do
    assert_difference('ProductThumbnail.count') do
      post :create, :product_thumbnail => @product_thumbnail.attributes
    end

    assert_redirected_to product_thumbnail_path(assigns(:product_thumbnail))
  end

  test "should show product_thumbnail" do
    get :show, :id => @product_thumbnail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_thumbnail.to_param
    assert_response :success
  end

  test "should update product_thumbnail" do
    put :update, :id => @product_thumbnail.to_param, :product_thumbnail => @product_thumbnail.attributes
    assert_redirected_to product_thumbnail_path(assigns(:product_thumbnail))
  end

  test "should destroy product_thumbnail" do
    assert_difference('ProductThumbnail.count', -1) do
      delete :destroy, :id => @product_thumbnail.to_param
    end

    assert_redirected_to product_thumbnails_path
  end
end
