class AddCourseIdToScore < ActiveRecord::Migration
  def change
    add_column :scores, :course_id, :integer
  end
end
