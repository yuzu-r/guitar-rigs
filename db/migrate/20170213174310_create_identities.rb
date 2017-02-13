class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :access_token
      t.string :uid
      t.string :username
      t.string :email
      t.string :name
      t.string :image
      t.string :urls
      t.timestamps null: false
    end
  end
end
