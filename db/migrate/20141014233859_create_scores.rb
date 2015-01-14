class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :points
      t.integer :time
      t.string :grade

      t.timestamps
    end
  end
end
