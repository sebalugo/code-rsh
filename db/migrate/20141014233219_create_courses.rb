class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :code
      t.integer :difficulty

      t.timestamps
    end
  end
end
