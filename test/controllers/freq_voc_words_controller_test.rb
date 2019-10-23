require 'test_helper'

class FreqVocWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @freq_voc_word = freq_voc_words(:one)
  end

  test "should get index" do
    get freq_voc_words_url
    assert_response :success
  end

  test "should get new" do
    get new_freq_voc_word_url
    assert_response :success
  end

  test "should create freq_voc_word" do
    assert_difference('FreqVocWord.count') do
      post freq_voc_words_url, params: { freq_voc_word: { frequency_vocabulary_id: @freq_voc_word.frequency_vocabulary_id, occurrence_rate: @freq_voc_word.occurrence_rate, word: @freq_voc_word.word } }
    end

    assert_redirected_to freq_voc_word_url(FreqVocWord.last)
  end

  test "should show freq_voc_word" do
    get freq_voc_word_url(@freq_voc_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_freq_voc_word_url(@freq_voc_word)
    assert_response :success
  end

  test "should update freq_voc_word" do
    patch freq_voc_word_url(@freq_voc_word), params: { freq_voc_word: { frequency_vocabulary_id: @freq_voc_word.frequency_vocabulary_id, occurrence_rate: @freq_voc_word.occurrence_rate, word: @freq_voc_word.word } }
    assert_redirected_to freq_voc_word_url(@freq_voc_word)
  end

  test "should destroy freq_voc_word" do
    assert_difference('FreqVocWord.count', -1) do
      delete freq_voc_word_url(@freq_voc_word)
    end

    assert_redirected_to freq_voc_words_url
  end
end
