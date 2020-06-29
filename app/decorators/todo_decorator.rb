class TodoDecorator
  attr_reader :todo
  
  def initialize(todo)
    @todo = todo
  end
  
  def classes
    classes = ['_capybara-todo', 'todo']
    classes << 'completed' if todo.complete
    classes.join(" ")
  end
  
  def method_missing(method_name, *args, &block)
    todo.send(method_name, *args, &block)
  end
  
  def respond_to?(method_name, include_private = false)
    todo.respond_to?(method_name, include_private) || super
  end
end