class AlterUsername < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, :limit => 16
  end
end
