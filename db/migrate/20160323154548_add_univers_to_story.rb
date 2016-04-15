class AddUniversToStory < ActiveRecord::Migration
  def change
    add_reference :stories, :univers, index: true
  end
end
