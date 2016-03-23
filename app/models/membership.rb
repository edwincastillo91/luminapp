class Membership < ActiveRecord::Base
  belongs_to :character
  belongs_to :society
end
