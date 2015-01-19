class CreateMatchesUsers < ActiveRecord::Migration
  def change
    create_table :matches_users,:id => false  do |t|
    	t.references :match
        t.references :user
    end
    add_index :matches_users, [:match_id, :user_id]
    add_index :matches_users, :user_id
  end
end
