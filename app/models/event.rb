class Event < ActiveRecord::Base
  has_and_belongs_to_many :calendars
  has_and_belongs_to_many :places
  has_many :participations
end
