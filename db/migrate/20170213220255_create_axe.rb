class CreateAxe < ActiveRecord::Migration
  def change
    create_table :axes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.integer :like_count
      t.timestamps null: false
    end
  end
end
