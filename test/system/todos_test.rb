require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Todos"
  end

  test "creating a Todo" do
    visit todos_url
    click_on "New Todo"

    check "Complete" if @todo.complete
    fill_in "Due at", with: @todo.due_at
    fill_in "Priority", with: @todo.priority
    fill_in "Summary", with: @todo.summary
    click_on "Create Todo"

    assert_text "Todo was successfully created"
    click_on "Back"
  end

  test "updating a Todo" do
    visit todos_url
    click_on "Edit", match: :first

    check "Complete" if @todo.complete
    fill_in "Due at", with: @todo.due_at
    fill_in "Priority", with: @todo.priority
    fill_in "Summary", with: @todo.summary
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
    click_on "Back"
  end

  test "destroying a Todo" do
    visit todos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todo was successfully destroyed"
  end
end
