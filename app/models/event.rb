class Event < ActiveRecord::Base	
  belongs_to :univers
  default_scope -> { order(created_at: :desc) }
  validates :univers_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
	
	belongs_to :day
	accepts_nested_attributes_for :day
#	validates_presence_of :day
	belongs_to :place
	accepts_nested_attributes_for :place
	validates_presence_of :place
	
	validates_uniqueness_of :name, scope: :univers_id
	
	
	
	
	
	
	 has_many :participations
  has_and_belongs_to_many :scenes

	#virtual attribute
#	def place_name
#		place.name if place
#	end
#	
#	def place_name=(name)
#		self.place = Place.find_or_create_by_name(name) || name.blank
#		@place_name.create_by_name(name)
#	end
	

	


	

end
