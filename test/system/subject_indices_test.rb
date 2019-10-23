require "application_system_test_case"

class SubjectIndicesTest < ApplicationSystemTestCase
  setup do
    @subject_index = subject_indices(:one)
  end

  test "visiting the index" do
    visit subject_indices_url
    assert_selector "h1", text: "Subject Indices"
  end

  test "creating a Subject index" do
    visit subject_indices_url
    click_on "New Subject Index"

    fill_in "Book", with: @subject_index.book_id
    click_on "Create Subject index"

    assert_text "Subject index was successfully created"
    click_on "Back"
  end

  test "updating a Subject index" do
    visit subject_indices_url
    click_on "Edit", match: :first

    fill_in "Book", with: @subject_index.book_id
    click_on "Update Subject index"

    assert_text "Subject index was successfully updated"
    click_on "Back"
  end

  test "destroying a Subject index" do
    visit subject_indices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject index was successfully destroyed"
  end
end
