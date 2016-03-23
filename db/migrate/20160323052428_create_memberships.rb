class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :character, index: true
      t.references :society, index: true

      t.timestamps
    end
  end
end
