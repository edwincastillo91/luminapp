class AddUserToUnivers < ActiveRecord::Migration
  def change
    add_reference :universes, :user, index: true
  end
end
