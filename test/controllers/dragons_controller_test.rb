require 'test_helper'

class DragonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dragons_index_url
    assert_response :success
  end

  test "should get show" do
    get dragons_show_url
    assert_response :success
  end

  test "should get new" do
    get dragons_new_url
    assert_response :success
  end

  test "should get create" do
    get dragons_create_url
    assert_response :success
  end

  test "should get edit" do
    get dragons_edit_url
    assert_response :success
  end

  test "should get update" do
    get dragons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dragons_destroy_url
    assert_response :success
  end

end
