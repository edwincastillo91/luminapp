class AddUniversToChapter < ActiveRecord::Migration
  def change
    add_reference :chapters, :univers, index: true
  end
end
