class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :username, :string
    add_column :users, :name, :string
  end

  def down
    remove_column :users, :username
    remove_column :users, :name
  end
end
