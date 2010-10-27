require 'test_helper'

class BuchesControllerTest < ActionController::TestCase
  setup do
    @buch = buches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buch" do
    assert_difference('Buch.count') do
      post :create, :buch => @buch.attributes
    end

    assert_redirected_to buch_path(assigns(:buch))
  end

  test "should show buch" do
    get :show, :id => @buch.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @buch.to_param
    assert_response :success
  end

  test "should update buch" do
    put :update, :id => @buch.to_param, :buch => @buch.attributes
    assert_redirected_to buch_path(assigns(:buch))
  end

  test "should destroy buch" do
    assert_difference('Buch.count', -1) do
      delete :destroy, :id => @buch.to_param
    end

    assert_redirected_to buches_path
  end
end
