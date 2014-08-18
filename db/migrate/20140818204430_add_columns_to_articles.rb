class AddColumnsToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :user_id, :integer
  end

  def down
    remove_column :articles, :user_id, :integer
  end
end
