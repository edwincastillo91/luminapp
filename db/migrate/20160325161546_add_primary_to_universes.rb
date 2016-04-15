class AddPrimaryToUniverses < ActiveRecord::Migration
  def change
    add_column :universes, :primary, :boolean, default: false
  end
end
