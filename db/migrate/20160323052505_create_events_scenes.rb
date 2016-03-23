class CreateEventsScenes < ActiveRecord::Migration
  def change
    create_table :events_scenes do |t|
      t.belongs_to :event, index: true
      t.belongs_to :scene, index: true
    end
  end
end
