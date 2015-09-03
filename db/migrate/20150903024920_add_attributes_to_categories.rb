class AddAttributesToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :inheritance, :string
  	add_column :categories, :attr, :string
  	add_column :categories, :attr_name, :string
  end
end
