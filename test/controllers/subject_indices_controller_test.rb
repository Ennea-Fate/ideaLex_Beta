require 'test_helper'

class SubjectIndicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_index = subject_indices(:one)
  end

  test "should get index" do
    get subject_indices_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_index_url
    assert_response :success
  end

  test "should create subject_index" do
    assert_difference('SubjectIndex.count') do
      post subject_indices_url, params: { subject_index: { book_id: @subject_index.book_id } }
    end

    assert_redirected_to subject_index_url(SubjectIndex.last)
  end

  test "should show subject_index" do
    get subject_index_url(@subject_index)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_index_url(@subject_index)
    assert_response :success
  end

  test "should update subject_index" do
    patch subject_index_url(@subject_index), params: { subject_index: { book_id: @subject_index.book_id } }
    assert_redirected_to subject_index_url(@subject_index)
  end

  test "should destroy subject_index" do
    assert_difference('SubjectIndex.count', -1) do
      delete subject_index_url(@subject_index)
    end

    assert_redirected_to subject_indices_url
  end
end
