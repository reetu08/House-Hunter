require 'test_helper'

class InquiryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Valid Inquiry" do
    inquiry = inquiries(:one)
    assert inquiry.valid?
  end

  test "Inquiry with message too long" do
    inquiry = inquiries(:one)
    message = (0..250).inject('') { |memo| memo << 'b'}
    inquiry.message = message
    assert_not inquiry.valid?
  end

  test "Inquiry with subject too long" do
    inquiry = inquiries(:one)
    message = (0..40).inject('') { |memo| memo << 'b'}
    inquiry.subject = message
    assert_not inquiry.valid?
  end

  test "Inquiry with blank message" do
    inquiry = inquiries(:one)
    inquiry.message = ''
    assert_not inquiry.valid?
  end

  test "Inquiry with blank subject" do
    inquiry = inquiries(:one)
    inquiry.subject = ''
    assert_not inquiry.valid?
  end

  test "Get by User ID returns non-empty" do
    inquiries = Inquiry.where :user_id => users(:three).id
    assert_equal(inquiries.size, 2)
    assert inquiries.includes inquiries(:one)
  end

  test "Get by Realtor ID returns non-empty" do
    inquiries = Inquiry.for_realtor users(:one).id
    assert_equal(inquiries.size, 1)
    assert inquiries.includes inquiries(:two)
  end

end
