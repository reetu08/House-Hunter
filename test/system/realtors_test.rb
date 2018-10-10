require "application_system_test_case"

class RealtorsTest < ApplicationSystemTestCase
  setup do
    @realtor = realtors(:one)
  end

  test "visiting the index" do
    visit realtors_url
    assert_selector "h1", text: "Realtors"
  end

  test "creating a Realtor" do
    visit realtors_url
    click_on "New Realtor"

    click_on "Create Realtor"

    assert_text "Realtor was successfully created"
    click_on "Back"
  end

  test "updating a Realtor" do
    visit realtors_url
    click_on "Edit", match: :first

    click_on "Update Realtor"

    assert_text "Realtor was successfully updated"
    click_on "Back"
  end

  test "destroying a Realtor" do
    visit realtors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Realtor was successfully destroyed"
  end
end
