require 'test_helper'

class TodosIndexTest < ActionDispatch::IntegrationTest

  def setup
    @todo_1 = todos(:one) 
    @todo_2 = todos(:two)
    @todo_3 = todos(:three)
  end


  test "should order todos correctly" do
    @todo_2.save
    @todo_1.save
    @todo_3.save
    # get todos_path
    visit todos_path
    todos = all("._capybara-todo")
    assert_equal(todos.count, 3)
    within todos.first do
      assert page.has_content? @todo_2.summary
    end
    within todos.last do
      assert page.has_content? @todo_1.summary
    end
    # Sort by priority ascending 
    # visit todos_path(sort_by: :priority, direction: :asc)
    click_link('Priority')
    todos = all("._capybara-todo")
    assert_equal(todos.count, 3)
    within todos.first do
      assert page.has_content? @todo_1.summary
    end
    within todos.last do
      assert page.has_content? @todo_3.summary
    end
    # Sort by priority descending
    # visit todos_path(sort_by: :priority, direction: :desc)
    click_link('Priority')
    todos = all("._capybara-todo")
    within todos.first do
      assert page.has_content? @todo_3.summary
    end
    assert_equal(todos.count, 3)
    within todos.last do
      assert page.has_content? @todo_1.summary
    end
    # Sort by due_at ascending
    # visit todos_path(sort_by: :priority, direction: :asc)
    click_link('Due at')
    todos = all("._capybara-todo")
    assert_equal(todos.count, 3)
    within todos.first do
      assert page.has_content? @todo_2.summary
    end
    within todos.last do
      assert page.has_content? @todo_1.summary
    end
    # Sort by due_at descending
    click_link('Due at')
    todos = all("._capybara-todo")
    assert_equal(todos.count, 3)
    within todos.first do
      assert page.has_content? @todo_1.summary
    end
    within todos.last do
      assert page.has_content? @todo_2.summary
    end
    
    # assert_template 'todos/index'
    # todos = assigns(:todos)
    # # Default sorting sort by due_at descending
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=priority', count: 1
    # assert_select "a[href=?]", '/todos?direction=desc&sort_by=due_at', count: 1
    # assert_equal [@todo_2, @todo_3, @todo_1], todos
    # # Sort by priority ascending
    # get todos_path(sort_by: :priority, direction: :asc)
    # todos = assigns(:todos)
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=priority', count: 0
    # assert_select "a[href=?]", '/todos?direction=desc&sort_by=priority', count: 1
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=due_at', count: 1
    # assert_equal [@todo_1, @todo_2, @todo_3], todos
    # # Sort by priority descending
    # get todos_path(sort_by: :priority, direction: :desc)
    # todos = assigns(:todos)
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=priority', count: 1
    # assert_select "a[href=?]", '/todos?direction=desc&sort_by=priority', count: 0
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=due_at', count: 1
    # assert_equal [@todo_3, @todo_2, @todo_1], todos
    # # Sort by due_at ascending
    # get todos_path(sort_by: :due_at, direction: :asc)
    # todos = assigns(:todos)
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=priority', count: 1
    # assert_select "a[href=?]", '/todos?direction=desc&sort_by=due_at', count: 1
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=due_at', count: 0
    # assert_equal [@todo_2, @todo_3, @todo_1], todos
    # # Sort by due_at descending
    # get todos_path(sort_by: :due_at, direction: :desc)
    # todos = assigns(:todos)
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=priority', count: 1
    # assert_select "a[href=?]", '/todos?direction=desc&sort_by=due_at', count: 0
    # assert_select "a[href=?]", '/todos?direction=asc&sort_by=due_at', count: 1
    # assert_equal [@todo_1, @todo_3, @todo_2], todos
  end
  
end
