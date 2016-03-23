class CreateCharactersRelationships < ActiveRecord::Migration
  def change
    create_table :characters_relationships do |t|
      t.belongs_to :character, index: true
      t.belongs_to :relationship, index: true
    end
  end
end
