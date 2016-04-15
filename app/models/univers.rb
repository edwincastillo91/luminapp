class Univers < ActiveRecord::Base
	before_save :new_primary
	
	
	
	#User -> Universes
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :name, presence: true, length: { maximum: 140 }

	##Univers -> Stories
	has_many :stories, dependent: :destroy

	#Univers -> Events
	has_many :events, dependent: :destroy
	
	#Univers -> Characters
	has_many :characters, dependent: :destroy
	
	#Univers -> Places
	has_many :places, dependent: :destroy
	
	#Univers -> Places
	has_many :chapters, dependent: :destroy
	
	#Univers -> Places
	has_many :days, dependent: :destroy
	
	
	 


	
	def new_primary #falsifies old primary univers as fasle
		Univers.where(user_id: self.user_id).where.not(id: self.id).update_all(:primary => 'false')
	end
	
	
	



end
