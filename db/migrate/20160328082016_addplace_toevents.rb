class AddplaceToevents < ActiveRecord::Migration
  def change
	  add_reference :events, :place, index: true
  end
end
