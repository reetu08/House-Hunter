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

end
