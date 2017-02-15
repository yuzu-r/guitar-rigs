class RemoveCount < ActiveRecord::Migration
  def change
    remove_column :axes, :like_count
  end
end
