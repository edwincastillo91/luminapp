class Character < ActiveRecord::Base

  has_and_belongs_to_many :relationships
  has_many :participations
  has_many :memberships
	
	
	
	
	belongs_to :univers
  default_scope -> { order(created_at: :desc) }
  validates :univers_id, presence: true
	validates :first_name, presence: true, length: { maximum: 140 }
end
