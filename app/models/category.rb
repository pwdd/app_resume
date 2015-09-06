class Category < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :posts, through: :categorizations

	def as_json(options = {})
		super(options.merge(include: :posts))		
	end
end
