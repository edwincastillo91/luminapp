class AddUniversToPlace < ActiveRecord::Migration
  def change
    add_reference :places, :univers, index: true
  end
end
