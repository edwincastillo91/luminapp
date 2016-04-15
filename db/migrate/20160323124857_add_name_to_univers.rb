class AddNameToUnivers < ActiveRecord::Migration
  def change
    add_column :univers, :name, :string
  end
end
