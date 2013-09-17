class Chapter < ActiveRecord::Base
	belongs_to :story
	paginates_per 1
	def prev?
		return number >1
	end

	def next?
		return number < story.chapters.count
	end
	def prev
		return Chapter.find_by_number_and_story_id(number-1,story_id)
	end
	def next
		return Chapter.find_by_number_and_story_id(number+1,story_id)
	end

end
