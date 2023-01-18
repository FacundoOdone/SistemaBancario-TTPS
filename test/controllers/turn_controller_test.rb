require "test_helper"

class TurnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get turn_index_url
    assert_response :success
  end

  test "should get new" do
    get turn_new_url
    assert_response :success
  end

  test "should get edit" do
    get turn_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get turn_destroy_url
    assert_response :success
  end
end
