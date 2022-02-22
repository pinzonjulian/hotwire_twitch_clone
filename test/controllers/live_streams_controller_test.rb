require "test_helper"

class LiveStreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @live_stream = live_streams(:one)
  end

  test "should get index" do
    get live_streams_url
    assert_response :success
  end

  test "should get new" do
    get new_live_stream_url
    assert_response :success
  end

  test "should create live_stream" do
    assert_difference("LiveStream.count") do
      post live_streams_url, params: { live_stream: { name: @live_stream.name, url: @live_stream.url } }
    end

    assert_redirected_to live_stream_url(LiveStream.last)
  end

  test "should show live_stream" do
    get live_stream_url(@live_stream)
    assert_response :success
  end

  test "should get edit" do
    get edit_live_stream_url(@live_stream)
    assert_response :success
  end

  test "should update live_stream" do
    patch live_stream_url(@live_stream), params: { live_stream: { name: @live_stream.name, url: @live_stream.url } }
    assert_redirected_to live_stream_url(@live_stream)
  end

  test "should destroy live_stream" do
    assert_difference("LiveStream.count", -1) do
      delete live_stream_url(@live_stream)
    end

    assert_redirected_to live_streams_url
  end
end
