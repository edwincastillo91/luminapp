class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :type
      t.integer :intensity

      t.timestamps
    end
  end
end
