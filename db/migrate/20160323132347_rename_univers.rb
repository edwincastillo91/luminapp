class RenameUnivers < ActiveRecord::Migration
  def change
  	rename_table :univers, :universes
 	end
end
