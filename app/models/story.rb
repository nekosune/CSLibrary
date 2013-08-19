class Story < ActiveRecord::Base
	has_many :Chapters
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :tags
end
