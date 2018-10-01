require 'test_helper'

class InquiryRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inquiry_reply = inquiry_replies(:one)
  end

  test "should get index" do
    get inquiry_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_inquiry_reply_url
    assert_response :success
  end

  test "should create inquiry_reply" do
    assert_difference('InquiryReply.count') do
      post inquiry_replies_url, params: { inquiry_reply: {  } }
    end

    assert_redirected_to inquiry_reply_url(InquiryReply.last)
  end

  test "should show inquiry_reply" do
    get inquiry_reply_url(@inquiry_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_inquiry_reply_url(@inquiry_reply)
    assert_response :success
  end

  test "should update inquiry_reply" do
    patch inquiry_reply_url(@inquiry_reply), params: { inquiry_reply: {  } }
    assert_redirected_to inquiry_reply_url(@inquiry_reply)
  end

  test "should destroy inquiry_reply" do
    assert_difference('InquiryReply.count', -1) do
      delete inquiry_reply_url(@inquiry_reply)
    end

    assert_redirected_to inquiry_replies_url
  end
end
