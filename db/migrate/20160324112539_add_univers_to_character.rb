class AddUniversToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :univers, index: true
  end
end
