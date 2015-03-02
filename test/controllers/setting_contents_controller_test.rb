require 'test_helper'

class SettingContentsControllerTest < ActionController::TestCase
  setup do
    @setting_content = setting_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setting_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting_content" do
    assert_difference('SettingContent.count') do
      post :create, setting_content: { about_us: @setting_content.about_us, terms_condition: @setting_content.terms_condition }
    end

    assert_redirected_to setting_content_path(assigns(:setting_content))
  end

  test "should show setting_content" do
    get :show, id: @setting_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting_content
    assert_response :success
  end

  test "should update setting_content" do
    patch :update, id: @setting_content, setting_content: { about_us: @setting_content.about_us, terms_condition: @setting_content.terms_condition }
    assert_redirected_to setting_content_path(assigns(:setting_content))
  end

  test "should destroy setting_content" do
    assert_difference('SettingContent.count', -1) do
      delete :destroy, id: @setting_content
    end

    assert_redirected_to setting_contents_path
  end
end
