class Place < ActiveRecord::Base
	belongs_to :univers
	default_scope -> { order(created_at: :desc) }
	validates :univers_id, presence: true
	validates :name, presence: true, length: { maximum: 140 }
	
	has_many :events
	accepts_nested_attributes_for :events
	
	validates_uniqueness_of :name, scope: :univers_id
	
		#for the text_method in forms
		def place_city_country
				"#{name} in #{city}, #{country}"
  		end
	
	def country_name
		if ISO3166::Country[country]
		the_country = ISO3166::Country[country]
		the_country.translations[I18n.locale.to_s] || country.name
		end
  	end
	
	
	
end
