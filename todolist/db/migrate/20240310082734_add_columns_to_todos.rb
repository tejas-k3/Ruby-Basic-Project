class AddColumnsToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :name, :string
    add_column :todos, :description, :text
    add_column :todos, :state, :integer, default: 0 # Default to 0 (created)
  end
end