require 'test_helper'

class SearchEngineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_engine_index_url
    assert_response :success
  end

  test "should get unanimous" do
    get search_engine_unanimous_url
    assert_response :success
  end

  test "should get concordance" do
    get search_engine_concordance_url
    assert_response :success
  end

  test "should get freqvoc" do
    get search_engine_freqvoc_url
    assert_response :success
  end

  test "should get grammdict" do
    get search_engine_grammdict_url
    assert_response :success
  end

end
