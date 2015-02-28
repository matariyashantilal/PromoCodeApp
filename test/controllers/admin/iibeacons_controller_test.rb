require 'test_helper'

class IibeaconsControllerTest < ActionController::TestCase
  setup do
    @iibeacon = iibeacons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iibeacons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iibeacon" do
    assert_difference('Iibeacon.count') do
      post :create, iibeacon: { major: @iibeacon.major, minor: @iibeacon.minor, udid: @iibeacon.udid }
    end

    assert_redirected_to iibeacon_path(assigns(:iibeacon))
  end

  test "should show iibeacon" do
    get :show, id: @iibeacon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iibeacon
    assert_response :success
  end

  test "should update iibeacon" do
    patch :update, id: @iibeacon, iibeacon: { major: @iibeacon.major, minor: @iibeacon.minor, udid: @iibeacon.udid }
    assert_redirected_to iibeacon_path(assigns(:iibeacon))
  end

  test "should destroy iibeacon" do
    assert_difference('Iibeacon.count', -1) do
      delete :destroy, id: @iibeacon
    end

    assert_redirected_to iibeacons_path
  end
end
