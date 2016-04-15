class AddDayToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :day, index: true
  end
end
