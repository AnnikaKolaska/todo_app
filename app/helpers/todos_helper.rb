module TodosHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, todos_path(sort_by: column, direction: direction)
  end

end
