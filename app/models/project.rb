class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :student

	validates_presence_of :budget , :description , :title , :deadline,:poster_id
	validates_length_of :description, minimum: 0, maximum: 400

end
