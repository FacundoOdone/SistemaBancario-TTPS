require "test_helper"

class BranchofficeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get branchoffice_new_url
    assert_response :success
  end

  test "should get edit" do
    get branchoffice_edit_url
    assert_response :success
  end

  test "should get index" do
    get branchoffice_index_url
    assert_response :success
  end
end
