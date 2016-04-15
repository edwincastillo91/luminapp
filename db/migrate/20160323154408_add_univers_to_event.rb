class AddUniversToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :univers, index: true
  end
end
