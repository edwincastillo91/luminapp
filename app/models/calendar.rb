class Calendar < ActiveRecord::Base
  has_and_belongs_to_many :events, through: :calendars_events
end
