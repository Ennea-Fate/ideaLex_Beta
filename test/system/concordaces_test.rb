require "application_system_test_case"

class ConcordacesTest < ApplicationSystemTestCase
  setup do
    @concordace = concordaces(:one)
  end

  test "visiting the index" do
    visit concordaces_url
    assert_selector "h1", text: "Concordaces"
  end

  test "creating a Concordace" do
    visit concordaces_url
    click_on "New Concordace"

    fill_in "Book", with: @concordace.book_id
    click_on "Create Concordace"

    assert_text "Concordace was successfully created"
    click_on "Back"
  end

  test "updating a Concordace" do
    visit concordaces_url
    click_on "Edit", match: :first

    fill_in "Book", with: @concordace.book_id
    click_on "Update Concordace"

    assert_text "Concordace was successfully updated"
    click_on "Back"
  end

  test "destroying a Concordace" do
    visit concordaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Concordace was successfully destroyed"
  end
end
