require 'test_helper'

class InquiryRepliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @inquiry_reply = inquiry_replies(:one)
    @inquiry = inquiries(:one)
    @user = users(:three)
    sign_in @user
  end

  test "should get new" do
    get new_inquiry_reply_url(:inquiry_id => @inquiry.id)
    assert_response :success
  end

  test "should create inquiry_reply" do
    assert_difference('InquiryReply.count') do
      post inquiry_replies_url, params: { inquiry_reply: { :inquiry_id => @inquiry.id, :realtor_id => @user.id, :message => 'message' } }
    end

    reply = InquiryReply.last

    assert_redirected_to inquiry_reply_url(reply)
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
    patch inquiry_reply_url(@inquiry_reply), params: { inquiry_reply: { :message => 'message' } }
    assert_redirected_to inquiry_reply_url(@inquiry_reply)
  end

  test "should destroy inquiry_reply" do
    assert_difference('InquiryReply.count', -1) do
      delete inquiry_reply_url(@inquiry_reply)
    end

    assert_redirected_to inquiries_path
  end
end
