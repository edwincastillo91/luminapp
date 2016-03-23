class Character < ActiveRecord::Base
  has_and_belongs_to_many :relationships
  has_many :participations
  has_many :memberships
end
