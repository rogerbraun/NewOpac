require 'test_helper'

class LendingsControllerTest < ActionController::TestCase
  setup do
    @lending = lendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lending" do
    assert_difference('Lending.count') do
      post :create, :lending => @lending.attributes
    end

    assert_redirected_to lending_path(assigns(:lending))
  end

  test "should show lending" do
    get :show, :id => @lending.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lending.to_param
    assert_response :success
  end

  test "should update lending" do
    put :update, :id => @lending.to_param, :lending => @lending.attributes
    assert_redirected_to lending_path(assigns(:lending))
  end

  test "should destroy lending" do
    assert_difference('Lending.count', -1) do
      delete :destroy, :id => @lending.to_param
    end

    assert_redirected_to lendings_path
  end
end
