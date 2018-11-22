require 'test_helper'

class VariablesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get variables_update_url
    assert_response :success
  end

  test "should get edit" do
    get variables_edit_url
    assert_response :success
  end

  test "should get create" do
    get variables_create_url
    assert_response :success
  end

end
