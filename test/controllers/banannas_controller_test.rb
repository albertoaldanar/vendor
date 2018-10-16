require 'test_helper'

class BanannasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bananna = banannas(:one)
  end

  test "should get index" do
    get banannas_url, as: :json
    assert_response :success
  end

  test "should create bananna" do
    assert_difference('Bananna.count') do
      post banannas_url, params: { bananna: { color: @bananna.color, price: @bananna.price } }, as: :json
    end

    assert_response 201
  end

  test "should show bananna" do
    get bananna_url(@bananna), as: :json
    assert_response :success
  end

  test "should update bananna" do
    patch bananna_url(@bananna), params: { bananna: { color: @bananna.color, price: @bananna.price } }, as: :json
    assert_response 200
  end

  test "should destroy bananna" do
    assert_difference('Bananna.count', -1) do
      delete bananna_url(@bananna), as: :json
    end

    assert_response 204
  end
end
