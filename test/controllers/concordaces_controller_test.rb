require 'test_helper'

class ConcordacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concordace = concordaces(:one)
  end

  test "should get index" do
    get concordaces_url
    assert_response :success
  end

  test "should get new" do
    get new_concordace_url
    assert_response :success
  end

  test "should create concordace" do
    assert_difference('Concordace.count') do
      post concordaces_url, params: { concordace: { book_id: @concordace.book_id } }
    end

    assert_redirected_to concordace_url(Concordace.last)
  end

  test "should show concordace" do
    get concordace_url(@concordace)
    assert_response :success
  end

  test "should get edit" do
    get edit_concordace_url(@concordace)
    assert_response :success
  end

  test "should update concordace" do
    patch concordace_url(@concordace), params: { concordace: { book_id: @concordace.book_id } }
    assert_redirected_to concordace_url(@concordace)
  end

  test "should destroy concordace" do
    assert_difference('Concordace.count', -1) do
      delete concordace_url(@concordace)
    end

    assert_redirected_to concordaces_url
  end
end
