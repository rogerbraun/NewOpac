require 'test_helper'

class EntleihersControllerTest < ActionController::TestCase
  setup do
    @entleiher = entleihers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entleihers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entleiher" do
    assert_difference('Entleiher.count') do
      post :create, :entleiher => @entleiher.attributes
    end

    assert_redirected_to entleiher_path(assigns(:entleiher))
  end

  test "should show entleiher" do
    get :show, :id => @entleiher.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @entleiher.to_param
    assert_response :success
  end

  test "should update entleiher" do
    put :update, :id => @entleiher.to_param, :entleiher => @entleiher.attributes
    assert_redirected_to entleiher_path(assigns(:entleiher))
  end

  test "should destroy entleiher" do
    assert_difference('Entleiher.count', -1) do
      delete :destroy, :id => @entleiher.to_param
    end

    assert_redirected_to entleihers_path
  end
end
