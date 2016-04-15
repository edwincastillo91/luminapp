class Day < ActiveRecord::Base

	belongs_to :univers
	has_many :events
	
	
	validates_uniqueness_of :date,  scope: :univers_id
end
