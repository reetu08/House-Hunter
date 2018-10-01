require "application_system_test_case"

class InquiryRepliesTest < ApplicationSystemTestCase
  setup do
    @inquiry_reply = inquiry_replies(:one)
  end

  test "visiting the index" do
    visit inquiry_replies_url
    assert_selector "h1", text: "Inquiry Replies"
  end

  test "creating a Inquiry reply" do
    visit inquiry_replies_url
    click_on "New Inquiry Reply"

    click_on "Create Inquiry reply"

    assert_text "Inquiry reply was successfully created"
    click_on "Back"
  end

  test "updating a Inquiry reply" do
    visit inquiry_replies_url
    click_on "Edit", match: :first

    click_on "Update Inquiry reply"

    assert_text "Inquiry reply was successfully updated"
    click_on "Back"
  end

  test "destroying a Inquiry reply" do
    visit inquiry_replies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inquiry reply was successfully destroyed"
  end
end
