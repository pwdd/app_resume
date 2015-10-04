class AddAltTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :alttitle, :string
  end
end
