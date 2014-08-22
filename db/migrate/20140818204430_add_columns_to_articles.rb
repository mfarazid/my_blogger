class AddColumnsToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :user_id, :integer
    add_column :articles, :view_count, :integer, :default => 0
    add_column :articles, :like, :integer, :default => 0
    add_column :articles, :hidden, :boolean
    add_column :articles, :published_at, :datetime
  end

  def down
    remove_column :articles, :user_id
    remove_column :articles, :view_count
    remove_column :articles, :like
    remove_column :articles, :hidden
    remove_column :articles, :published_at
  end
end
