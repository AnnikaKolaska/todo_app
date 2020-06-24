json.extract! todo, :id, :summary, :priority, :due_at, :complete, :created_at, :updated_at
json.url todo_url(todo, format: :json)
