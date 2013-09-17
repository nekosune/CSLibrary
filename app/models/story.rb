class Story < ActiveRecord::Base
	has_many :chapters
	paginates_per 1
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :tags

	def chapterList(page,overlap)
		


	end
end
