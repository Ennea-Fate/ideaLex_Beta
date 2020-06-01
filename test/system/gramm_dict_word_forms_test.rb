require "application_system_test_case"

class GrammDictWordFormsTest < ApplicationSystemTestCase
  setup do
    @gramm_dict_word_form = gramm_dict_word_forms(:one)
  end

  test "visiting the index" do
    visit gramm_dict_word_forms_url
    assert_selector "h1", text: "Gramm Dict Word Forms"
  end

  test "creating a Gramm dict word form" do
    visit gramm_dict_word_forms_url
    click_on "New Gramm Dict Word Form"

    fill_in "Chars", with: @gramm_dict_word_form.chars
    fill_in "Entries", with: @gramm_dict_word_form.entries
    fill_in "Gramm dict words", with: @gramm_dict_word_form.gramm_dict_words_id
    fill_in "Word", with: @gramm_dict_word_form.word
    click_on "Create Gramm dict word form"

    assert_text "Gramm dict word form was successfully created"
    click_on "Back"
  end

  test "updating a Gramm dict word form" do
    visit gramm_dict_word_forms_url
    click_on "Edit", match: :first

    fill_in "Chars", with: @gramm_dict_word_form.chars
    fill_in "Entries", with: @gramm_dict_word_form.entries
    fill_in "Gramm dict words", with: @gramm_dict_word_form.gramm_dict_words_id
    fill_in "Word", with: @gramm_dict_word_form.word
    click_on "Update Gramm dict word form"

    assert_text "Gramm dict word form was successfully updated"
    click_on "Back"
  end

  test "destroying a Gramm dict word form" do
    visit gramm_dict_word_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gramm dict word form was successfully destroyed"
  end
end
