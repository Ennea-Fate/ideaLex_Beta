require "application_system_test_case"

class SubjIndWordsTest < ApplicationSystemTestCase
  setup do
    @subj_ind_word = subj_ind_words(:one)
  end

  test "visiting the index" do
    visit subj_ind_words_url
    assert_selector "h1", text: "Subj Ind Words"
  end

  test "creating a Subj ind word" do
    visit subj_ind_words_url
    click_on "New Subj Ind Word"

    fill_in "Pages", with: @subj_ind_word.pages
    fill_in "Subject index", with: @subj_ind_word.subject_index_id
    fill_in "Word", with: @subj_ind_word.word
    click_on "Create Subj ind word"

    assert_text "Subj ind word was successfully created"
    click_on "Back"
  end

  test "updating a Subj ind word" do
    visit subj_ind_words_url
    click_on "Edit", match: :first

    fill_in "Pages", with: @subj_ind_word.pages
    fill_in "Subject index", with: @subj_ind_word.subject_index_id
    fill_in "Word", with: @subj_ind_word.word
    click_on "Update Subj ind word"

    assert_text "Subj ind word was successfully updated"
    click_on "Back"
  end

  test "destroying a Subj ind word" do
    visit subj_ind_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subj ind word was successfully destroyed"
  end
end
