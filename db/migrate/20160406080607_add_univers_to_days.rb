class AddUniversToDays < ActiveRecord::Migration
  def change
    add_reference :days, :univers, index: true
  end
end
