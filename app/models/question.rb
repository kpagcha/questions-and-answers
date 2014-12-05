class Question < ActiveRecord::Base
	has_many :votes
	has_many :answers
	belongs_to :category

	attr_reader :name
end
