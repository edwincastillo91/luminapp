class CreateArtefacts < ActiveRecord::Migration
  def change
    create_table :artefacts do |t|
      t.string :name

      t.timestamps
    end
  end
end
