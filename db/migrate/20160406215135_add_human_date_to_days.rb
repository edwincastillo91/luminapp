class AddHumanDateToDays < ActiveRecord::Migration
  def change
	  add_column :days, :human_day, :string
  end
end
