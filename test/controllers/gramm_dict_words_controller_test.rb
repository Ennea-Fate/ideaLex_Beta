require 'test_helper'

class GrammDictWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gramm_dict_word = gramm_dict_words(:one)
  end

  test "should get index" do
    get gramm_dict_words_url
    assert_response :success
  end

  test "should get new" do
    get new_gramm_dict_word_url
    assert_response :success
  end

  test "should create gramm_dict_word" do
    assert_difference('GrammDictWord.count') do
      post gramm_dict_words_url, params: { gramm_dict_word: { chars: @gramm_dict_word.chars, grammar_dictionary_id: @gramm_dict_word.grammar_dictionary_id, word: @gramm_dict_word.word } }
    end

    assert_redirected_to gramm_dict_word_url(GrammDictWord.last)
  end

  test "should show gramm_dict_word" do
    get gramm_dict_word_url(@gramm_dict_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_gramm_dict_word_url(@gramm_dict_word)
    assert_response :success
  end

  test "should update gramm_dict_word" do
    patch gramm_dict_word_url(@gramm_dict_word), params: { gramm_dict_word: { chars: @gramm_dict_word.chars, grammar_dictionary_id: @gramm_dict_word.grammar_dictionary_id, word: @gramm_dict_word.word } }
    assert_redirected_to gramm_dict_word_url(@gramm_dict_word)
  end

  test "should destroy gramm_dict_word" do
    assert_difference('GrammDictWord.count', -1) do
      delete gramm_dict_word_url(@gramm_dict_word)
    end

    assert_redirected_to gramm_dict_words_url
  end
end
