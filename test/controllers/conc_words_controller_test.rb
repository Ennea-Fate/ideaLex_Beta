require 'test_helper'

class ConcWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conc_word = conc_words(:one)
  end

  test "should get index" do
    get conc_words_url
    assert_response :success
  end

  test "should get new" do
    get new_conc_word_url
    assert_response :success
  end

  test "should create conc_word" do
    assert_difference('ConcWord.count') do
      post conc_words_url, params: { conc_word: { concordance: @conc_word.concordance, concordance_id: @conc_word.concordance_id, pages: @conc_word.pages, word: @conc_word.word } }
    end

    assert_redirected_to conc_word_url(ConcWord.last)
  end

  test "should show conc_word" do
    get conc_word_url(@conc_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_conc_word_url(@conc_word)
    assert_response :success
  end

  test "should update conc_word" do
    patch conc_word_url(@conc_word), params: { conc_word: { concordance: @conc_word.concordance, concordance_id: @conc_word.concordance_id, pages: @conc_word.pages, word: @conc_word.word } }
    assert_redirected_to conc_word_url(@conc_word)
  end

  test "should destroy conc_word" do
    assert_difference('ConcWord.count', -1) do
      delete conc_word_url(@conc_word)
    end

    assert_redirected_to conc_words_url
  end
end
