class AddImportanceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :importance, :integer
  end
end
