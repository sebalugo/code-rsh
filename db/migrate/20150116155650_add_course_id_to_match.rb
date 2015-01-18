class AddCourseIdToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :course_id, :integer
  end
end
