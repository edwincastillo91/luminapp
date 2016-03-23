class Story < ActiveRecord::Base
  has_many :scene_orders
end
