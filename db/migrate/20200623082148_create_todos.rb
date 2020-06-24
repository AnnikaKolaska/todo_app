class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :summary, null: false
      t.integer :priority, inclusion: { in: [1, 2, 3, 4] }, default: 4
      t.datetime :due_at
      t.boolean :complete, null: false, default: false 

      t.timestamps
    end
  end
end
