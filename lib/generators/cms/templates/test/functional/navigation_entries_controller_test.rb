require 'test_helper'

class NavigationEntriesControllerTest < ActionController::TestCase
  setup do
    @navigation_entry = navigation_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:navigation_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create navigation_entry" do
    assert_difference('NavigationEntry.count') do
      post :create, :navigation_entry => @navigation_entry.attributes
    end

    assert_redirected_to navigation_entry_path(assigns(:navigation_entry))
  end

  test "should show navigation_entry" do
    get :show, :id => @navigation_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @navigation_entry.to_param
    assert_response :success
  end

  test "should update navigation_entry" do
    put :update, :id => @navigation_entry.to_param, :navigation_entry => @navigation_entry.attributes
    assert_redirected_to navigation_entry_path(assigns(:navigation_entry))
  end

  test "should destroy navigation_entry" do
    assert_difference('NavigationEntry.count', -1) do
      delete :destroy, :id => @navigation_entry.to_param
    end

    assert_redirected_to navigation_entries_path
  end
end
