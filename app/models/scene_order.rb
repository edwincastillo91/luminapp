class SceneOrder < ActiveRecord::Base
  belongs_to :story
  belongs_to :scene
end
