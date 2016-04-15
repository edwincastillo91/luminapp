class Event < ActiveRecord::Base	
  belongs_to :univers
  default_scope -> { order(created_at: :desc) }
  validates :univers_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
	
	belongs_to :day
	belongs_to :place
	accepts_nested_attributes_for :place
	
	
	
	
	
	 has_many :participations
  has_and_belongs_to_many :scenes

	
	
	


	

end
