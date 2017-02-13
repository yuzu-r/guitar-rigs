class AddDefaultToLikes < ActiveRecord::Migration
  def change
    change_column_default :axes, :like_count, 0    
  end
end
