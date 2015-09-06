class AddAttributesToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :name, :string
  	add_column :courses, :where, :string
  	add_column :courses, :university, :string
  	add_column :courses, :status, :string
  end
end
