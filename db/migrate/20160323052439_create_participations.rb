class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :character, index: true
      t.references :event, index: true
      t.references :experience, index: true

      t.timestamps
    end
  end
end
