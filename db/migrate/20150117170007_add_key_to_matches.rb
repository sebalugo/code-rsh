class AddKeyToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :key, :string
  end
end
