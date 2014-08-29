class AddCourseIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :course_id, :integer
    add_index :notes, :course_id
  end
end
