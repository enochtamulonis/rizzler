require "test_helper"

class PickupLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup_line = pickup_lines(:one)
  end

  test "should get index" do
    get pickup_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_pickup_line_url
    assert_response :success
  end

  test "should create pickup_line" do
    assert_difference("PickupLine.count") do
      post pickup_lines_url, params: { pickup_line: { text: @pickup_line.text, user_id: @pickup_line.user_id } }
    end

    assert_redirected_to pickup_line_url(PickupLine.last)
  end

  test "should show pickup_line" do
    get pickup_line_url(@pickup_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_pickup_line_url(@pickup_line)
    assert_response :success
  end

  test "should update pickup_line" do
    patch pickup_line_url(@pickup_line), params: { pickup_line: { text: @pickup_line.text, user_id: @pickup_line.user_id } }
    assert_redirected_to pickup_line_url(@pickup_line)
  end

  test "should destroy pickup_line" do
    assert_difference("PickupLine.count", -1) do
      delete pickup_line_url(@pickup_line)
    end

    assert_redirected_to pickup_lines_url
  end
end
