class AddCountryToPlaces < ActiveRecord::Migration
  def change
	  add_column :places, :country, :string
	  add_column :places, :subdivision, :string
	  add_column :places, :city, :string
  end
end
