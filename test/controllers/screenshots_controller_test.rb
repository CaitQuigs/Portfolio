require 'test_helper'

class ScreenshotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screenshots_index_url
    assert_response :success
  end

  test "should get show" do
    get screenshots_show_url
    assert_response :success
  end

  test "should get edit" do
    get screenshots_edit_url
    assert_response :success
  end

  test "should get new" do
    get screenshots_new_url
    assert_response :success
  end

end
