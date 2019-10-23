require "application_system_test_case"

class FreqVocWordsTest < ApplicationSystemTestCase
  setup do
    @freq_voc_word = freq_voc_words(:one)
  end

  test "visiting the index" do
    visit freq_voc_words_url
    assert_selector "h1", text: "Freq Voc Words"
  end

  test "creating a Freq voc word" do
    visit freq_voc_words_url
    click_on "New Freq Voc Word"

    fill_in "Frequency vocabulary", with: @freq_voc_word.frequency_vocabulary_id
    fill_in "Occurrence rate", with: @freq_voc_word.occurrence_rate
    fill_in "Word", with: @freq_voc_word.word
    click_on "Create Freq voc word"

    assert_text "Freq voc word was successfully created"
    click_on "Back"
  end

  test "updating a Freq voc word" do
    visit freq_voc_words_url
    click_on "Edit", match: :first

    fill_in "Frequency vocabulary", with: @freq_voc_word.frequency_vocabulary_id
    fill_in "Occurrence rate", with: @freq_voc_word.occurrence_rate
    fill_in "Word", with: @freq_voc_word.word
    click_on "Update Freq voc word"

    assert_text "Freq voc word was successfully updated"
    click_on "Back"
  end

  test "destroying a Freq voc word" do
    visit freq_voc_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Freq voc word was successfully destroyed"
  end
end
