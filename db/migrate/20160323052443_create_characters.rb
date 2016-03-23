class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.text :drive
      t.text :wound
      t.string :eyes_color
      t.string :hair_color
      t.integer :height
      t.integer :weight
      t.string :race
      t.string :sex
      t.boolean :genetic_modification
      t.string :social_class
      t.string :sexual_orientation
      t.string :genre

      t.timestamps
    end
  end
end
