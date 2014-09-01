class AddCourseIdToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :course_id, :integer
    add_index :todo_items, :course_id
  end
end
