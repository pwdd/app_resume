class AddAttributesToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :image_url, :string
  	add_column :posts, :image_alt, :string
  	add_column :posts, :link, :string
  	add_column :posts, :source_code, :string
  end
end
