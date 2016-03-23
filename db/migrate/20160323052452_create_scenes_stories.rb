class CreateScenesStories < ActiveRecord::Migration
  def change
    create_table :scenes_stories do |t|
      t.belongs_to :scene, index: true
      t.belongs_to :story, index: true
    end
  end
end
