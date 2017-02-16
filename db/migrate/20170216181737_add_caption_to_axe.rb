class AddCaptionToAxe < ActiveRecord::Migration
  def change
    add_column :axes, :caption, :string, :limit => 100
  end
end
