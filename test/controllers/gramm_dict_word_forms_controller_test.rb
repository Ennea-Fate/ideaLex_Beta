require 'test_helper'

class GrammDictWordFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gramm_dict_word_form = gramm_dict_word_forms(:one)
  end

  test "should get index" do
    get gramm_dict_word_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_gramm_dict_word_form_url
    assert_response :success
  end

  test "should create gramm_dict_word_form" do
    assert_difference('GrammDictWordForm.count') do
      post gramm_dict_word_forms_url, params: { gramm_dict_word_form: { chars: @gramm_dict_word_form.chars, entries: @gramm_dict_word_form.entries, gramm_dict_words_id: @gramm_dict_word_form.gramm_dict_words_id, word: @gramm_dict_word_form.word } }
    end

    assert_redirected_to gramm_dict_word_form_url(GrammDictWordForm.last)
  end

  test "should show gramm_dict_word_form" do
    get gramm_dict_word_form_url(@gramm_dict_word_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_gramm_dict_word_form_url(@gramm_dict_word_form)
    assert_response :success
  end

  test "should update gramm_dict_word_form" do
    patch gramm_dict_word_form_url(@gramm_dict_word_form), params: { gramm_dict_word_form: { chars: @gramm_dict_word_form.chars, entries: @gramm_dict_word_form.entries, gramm_dict_words_id: @gramm_dict_word_form.gramm_dict_words_id, word: @gramm_dict_word_form.word } }
    assert_redirected_to gramm_dict_word_form_url(@gramm_dict_word_form)
  end

  test "should destroy gramm_dict_word_form" do
    assert_difference('GrammDictWordForm.count', -1) do
      delete gramm_dict_word_form_url(@gramm_dict_word_form)
    end

    assert_redirected_to gramm_dict_word_forms_url
  end
end
