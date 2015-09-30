class Post < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	def category_list
		self.categories.map do |category|
			category.name
		end.join(", ")
	end

	def category_list=(categories_string)
		category_names = categories_string.split(",").map { |s| s.strip }.uniq
		new_or_found_categories = category_names.map { |name|  Category.find_or_create_by(name: name) }
		self.categories = new_or_found_categories
	end

end
