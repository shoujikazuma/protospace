class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :team, :string
  end
end
