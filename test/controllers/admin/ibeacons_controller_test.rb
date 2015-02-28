require 'test_helper'

class IbeaconsControllerTest < ActionController::TestCase
  setup do
    @ibeacon = ibeacons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ibeacons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ibeacon" do
    assert_difference('Ibeacon.count') do
      post :create, ibeacon: { major: @ibeacon.major, minor: @ibeacon.minor, udid: @ibeacon.udid }
    end

    assert_redirected_to ibeacon_path(assigns(:ibeacon))
  end

  test "should show ibeacon" do
    get :show, id: @ibeacon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ibeacon
    assert_response :success
  end

  test "should update ibeacon" do
    patch :update, id: @ibeacon, ibeacon: { major: @ibeacon.major, minor: @ibeacon.minor, udid: @ibeacon.udid }
    assert_redirected_to ibeacon_path(assigns(:ibeacon))
  end

  test "should destroy ibeacon" do
    assert_difference('ibeacon.count', -1) do
      delete :destroy, id: @ibeacon
    end

    assert_redirected_to ibeacons_path
  end
end
