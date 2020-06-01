require 'test_helper'

class UnanimousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unanimou = unanimous(:one)
  end

  test "should get index" do
    get unanimous_url
    assert_response :success
  end

  test "should get new" do
    get new_unanimou_url
    assert_response :success
  end

  test "should create unanimou" do
    assert_difference('Unanimou.count') do
      post unanimous_url, params: { unanimou: { approves: @unanimou.approves, author_id: @unanimou.author_id, chars: @unanimou.chars, desc: @unanimou.desc, pos: @unanimou.pos, user_id: @unanimou.user_id, word: @unanimou.word } }
    end

    assert_redirected_to unanimou_url(Unanimou.last)
  end

  test "should show unanimou" do
    get unanimou_url(@unanimou)
    assert_response :success
  end

  test "should get edit" do
    get edit_unanimou_url(@unanimou)
    assert_response :success
  end

  test "should update unanimou" do
    patch unanimou_url(@unanimou), params: { unanimou: { approves: @unanimou.approves, author_id: @unanimou.author_id, chars: @unanimou.chars, desc: @unanimou.desc, pos: @unanimou.pos, user_id: @unanimou.user_id, word: @unanimou.word } }
    assert_redirected_to unanimou_url(@unanimou)
  end

  test "should destroy unanimou" do
    assert_difference('Unanimou.count', -1) do
      delete unanimou_url(@unanimou)
    end

    assert_redirected_to unanimous_url
  end
end
