require "application_system_test_case"

class ConcWordsTest < ApplicationSystemTestCase
  setup do
    @conc_word = conc_words(:one)
  end

  test "visiting the index" do
    visit conc_words_url
    assert_selector "h1", text: "Conc Words"
  end

  test "creating a Conc word" do
    visit conc_words_url
    click_on "New Conc Word"

    fill_in "Concordance", with: @conc_word.concordance
    fill_in "Concordance", with: @conc_word.concordance_id
    fill_in "Pages", with: @conc_word.pages
    fill_in "Word", with: @conc_word.word
    click_on "Create Conc word"

    assert_text "Conc word was successfully created"
    click_on "Back"
  end

  test "updating a Conc word" do
    visit conc_words_url
    click_on "Edit", match: :first

    fill_in "Concordance", with: @conc_word.concordance
    fill_in "Concordance", with: @conc_word.concordance_id
    fill_in "Pages", with: @conc_word.pages
    fill_in "Word", with: @conc_word.word
    click_on "Update Conc word"

    assert_text "Conc word was successfully updated"
    click_on "Back"
  end

  test "destroying a Conc word" do
    visit conc_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conc word was successfully destroyed"
  end
end
