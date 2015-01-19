class AddWpmToScores < ActiveRecord::Migration
  def change
    add_column :scores, :wpm, :float
  end
end
