class Scene < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_many :scene_orders
end
