require 'test_helper'

class SubjIndWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subj_ind_word = subj_ind_words(:one)
  end

  test "should get index" do
    get subj_ind_words_url
    assert_response :success
  end

  test "should get new" do
    get new_subj_ind_word_url
    assert_response :success
  end

  test "should create subj_ind_word" do
    assert_difference('SubjIndWord.count') do
      post subj_ind_words_url, params: { subj_ind_word: { pages: @subj_ind_word.pages, subject_index_id: @subj_ind_word.subject_index_id, word: @subj_ind_word.word } }
    end

    assert_redirected_to subj_ind_word_url(SubjIndWord.last)
  end

  test "should show subj_ind_word" do
    get subj_ind_word_url(@subj_ind_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_subj_ind_word_url(@subj_ind_word)
    assert_response :success
  end

  test "should update subj_ind_word" do
    patch subj_ind_word_url(@subj_ind_word), params: { subj_ind_word: { pages: @subj_ind_word.pages, subject_index_id: @subj_ind_word.subject_index_id, word: @subj_ind_word.word } }
    assert_redirected_to subj_ind_word_url(@subj_ind_word)
  end

  test "should destroy subj_ind_word" do
    assert_difference('SubjIndWord.count', -1) do
      delete subj_ind_word_url(@subj_ind_word)
    end

    assert_redirected_to subj_ind_words_url
  end
end
