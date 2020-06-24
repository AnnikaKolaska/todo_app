class Todo < ApplicationRecord
  validates :priority, inclusion: { in: 1..4 }    #{ in: %w(1 2 3 4) }
  
end
