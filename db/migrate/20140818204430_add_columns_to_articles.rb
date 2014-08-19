class AddColumnsToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :user_id, :integer
    add_column :articles, :view_count, :integer, :default => 1
    add_column :articles, :like, :integer, :default => 1
  end

  def down
    remove_column :articles, :user_id, :integer
    remove_column :articles, :view_count, :integer
    remove_column :articles, :like, :integer
  end
end
