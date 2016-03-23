class CreateEventsPlaces < ActiveRecord::Migration
  def change
    create_table :events_places do |t|
      t.belongs_to :event, index: true
      t.belongs_to :place, index: true
    end
  end
end
