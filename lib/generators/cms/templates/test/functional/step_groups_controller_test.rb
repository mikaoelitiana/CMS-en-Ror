require 'test_helper'

class StepGroupsControllerTest < ActionController::TestCase
  setup do
    @step_group = step_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_group" do
    assert_difference('StepGroup.count') do
      post :create, :step_group => @step_group.attributes
    end

    assert_redirected_to step_group_path(assigns(:step_group))
  end

  test "should show step_group" do
    get :show, :id => @step_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @step_group.to_param
    assert_response :success
  end

  test "should update step_group" do
    put :update, :id => @step_group.to_param, :step_group => @step_group.attributes
    assert_redirected_to step_group_path(assigns(:step_group))
  end

  test "should destroy step_group" do
    assert_difference('StepGroup.count', -1) do
      delete :destroy, :id => @step_group.to_param
    end

    assert_redirected_to step_groups_path
  end
end
