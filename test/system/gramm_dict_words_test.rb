require "application_system_test_case"

class GrammDictWordsTest < ApplicationSystemTestCase
  setup do
    @gramm_dict_word = gramm_dict_words(:one)
  end

  test "visiting the index" do
    visit gramm_dict_words_url
    assert_selector "h1", text: "Gramm Dict Words"
  end

  test "creating a Gramm dict word" do
    visit gramm_dict_words_url
    click_on "New Gramm Dict Word"

    fill_in "Chars", with: @gramm_dict_word.chars
    fill_in "Grammar dictionary", with: @gramm_dict_word.grammar_dictionary_id
    fill_in "Word", with: @gramm_dict_word.word
    click_on "Create Gramm dict word"

    assert_text "Gramm dict word was successfully created"
    click_on "Back"
  end

  test "updating a Gramm dict word" do
    visit gramm_dict_words_url
    click_on "Edit", match: :first

    fill_in "Chars", with: @gramm_dict_word.chars
    fill_in "Grammar dictionary", with: @gramm_dict_word.grammar_dictionary_id
    fill_in "Word", with: @gramm_dict_word.word
    click_on "Update Gramm dict word"

    assert_text "Gramm dict word was successfully updated"
    click_on "Back"
  end

  test "destroying a Gramm dict word" do
    visit gramm_dict_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gramm dict word was successfully destroyed"
  end
end
