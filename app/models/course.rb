class Course < ActiveRecord::Base
	belongs_to :category
	has_many :scores
	has_many :matches

	accepts_nested_attributes_for :scores
	accepts_nested_attributes_for :matches

	def self.getGrade( mistakes,time,score )
		finalScore = (score-(time * 0.25) ) - (mistakes * 3)
	end

	def self.getWpm( typed,time)
		wpm = (typed/5)/(time/60)
		wpm.round(3)
	end


end
