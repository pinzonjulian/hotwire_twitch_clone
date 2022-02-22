require "application_system_test_case"

class LiveStreamsTest < ApplicationSystemTestCase
  setup do
    @live_stream = live_streams(:one)
  end

  test "visiting the index" do
    visit live_streams_url
    assert_selector "h1", text: "Live streams"
  end

  test "should create live stream" do
    visit live_streams_url
    click_on "New live stream"

    fill_in "Name", with: @live_stream.name
    fill_in "Url", with: @live_stream.url
    click_on "Create Live stream"

    assert_text "Live stream was successfully created"
    click_on "Back"
  end

  test "should update Live stream" do
    visit live_stream_url(@live_stream)
    click_on "Edit this live stream", match: :first

    fill_in "Name", with: @live_stream.name
    fill_in "Url", with: @live_stream.url
    click_on "Update Live stream"

    assert_text "Live stream was successfully updated"
    click_on "Back"
  end

  test "should destroy Live stream" do
    visit live_stream_url(@live_stream)
    click_on "Destroy this live stream", match: :first

    assert_text "Live stream was successfully destroyed"
  end
end
