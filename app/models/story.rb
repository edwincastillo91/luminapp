class Story < ActiveRecord::Base
  has_many :scene_orders


  #univers
  belongs_to :univers
  default_scope -> { order(created_at: :desc) }
  validates :univers_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }

end
