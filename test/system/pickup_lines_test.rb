require "application_system_test_case"

class PickupLinesTest < ApplicationSystemTestCase
  setup do
    @pickup_line = pickup_lines(:one)
  end

  test "visiting the index" do
    visit pickup_lines_url
    assert_selector "h1", text: "Pickup lines"
  end

  test "should create pickup line" do
    visit pickup_lines_url
    click_on "New pickup line"

    fill_in "Text", with: @pickup_line.text
    fill_in "User", with: @pickup_line.user_id
    click_on "Create Pickup line"

    assert_text "Pickup line was successfully created"
    click_on "Back"
  end

  test "should update Pickup line" do
    visit pickup_line_url(@pickup_line)
    click_on "Edit this pickup line", match: :first

    fill_in "Text", with: @pickup_line.text
    fill_in "User", with: @pickup_line.user_id
    click_on "Update Pickup line"

    assert_text "Pickup line was successfully updated"
    click_on "Back"
  end

  test "should destroy Pickup line" do
    visit pickup_line_url(@pickup_line)
    click_on "Destroy this pickup line", match: :first

    assert_text "Pickup line was successfully destroyed"
  end
end
