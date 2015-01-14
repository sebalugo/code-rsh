class Foreign2 < ActiveRecord::Migration
  def change
  	add_column :scores, :category_id, :integer
  end
end
