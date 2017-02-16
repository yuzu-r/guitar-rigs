class AlterUsernameColumn < ActiveRecord::Migration
  def up
    change_column :users, :username, :string, :limit => 15
  end

  def down
    change_column :users, :username, :string, :limit => 16
  end
end
