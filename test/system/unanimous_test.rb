require "application_system_test_case"

class UnanimousTest < ApplicationSystemTestCase
  setup do
    @unanimou = unanimous(:one)
  end

  test "visiting the index" do
    visit unanimous_url
    assert_selector "h1", text: "Unanimous"
  end

  test "creating a Unanimou" do
    visit unanimous_url
    click_on "New Unanimou"

    check "Approves" if @unanimou.approves
    fill_in "Author", with: @unanimou.author_id
    fill_in "Chars", with: @unanimou.chars
    fill_in "Desc", with: @unanimou.desc
    fill_in "Pos", with: @unanimou.pos
    fill_in "User", with: @unanimou.user_id
    fill_in "Word", with: @unanimou.word
    click_on "Create Unanimou"

    assert_text "Unanimou was successfully created"
    click_on "Back"
  end

  test "updating a Unanimou" do
    visit unanimous_url
    click_on "Edit", match: :first

    check "Approves" if @unanimou.approves
    fill_in "Author", with: @unanimou.author_id
    fill_in "Chars", with: @unanimou.chars
    fill_in "Desc", with: @unanimou.desc
    fill_in "Pos", with: @unanimou.pos
    fill_in "User", with: @unanimou.user_id
    fill_in "Word", with: @unanimou.word
    click_on "Update Unanimou"

    assert_text "Unanimou was successfully updated"
    click_on "Back"
  end

  test "destroying a Unanimou" do
    visit unanimous_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unanimou was successfully destroyed"
  end
end
