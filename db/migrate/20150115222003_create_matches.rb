class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :category
      t.string :course
      t.string :first_player
      t.string :second_player
      t.float  :first_score
      t.float  :second_score
      t.float :match_time
      t.string :winner

      t.timestamps
    end
  end
end