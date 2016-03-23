class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :participation, index: true

      t.timestamps
    end
  end
end
