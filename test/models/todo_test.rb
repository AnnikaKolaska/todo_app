require 'test_helper'

class TodoTest < ActiveSupport::TestCase
 
 def setup
  @todo = Todo.new(summary: "Cleaning", priority: 2)
 end
 
 
 test "todo should be valid" do
   assert @todo.valid? 
 end
 
 test "todo should be invalid" do
    @todo.priority = 5
    assert_not @todo.valid?
    @todo.priority = 0
    assert_not @todo.valid?
 end
 
end
