class AddTwitterColumnsToHandleModel < ActiveRecord::Migration
  def change
    add_column :handles, :description, :string
    add_column :handles, :uri, :string
    add_column :handles, :profile_image_uri, :string
  end
end
