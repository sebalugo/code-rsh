class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.text :description
      t.string :logo_url
      t.references :user, index: true

      t.timestamps
    end
  end
end
