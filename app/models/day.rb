class Day < ActiveRecord::Base
	before_save :set_human_day
	belongs_to :univers
	has_many :events
	accepts_nested_attributes_for :events
	validates_uniqueness_of :date,  scope: :univers_id
	validates :date, presence: true
	validates :human_day, presence: true
	
	def set_human_day
	
	end
	
	
	
end
