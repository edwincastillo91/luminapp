class CreateUnivers < ActiveRecord::Migration
  def change
    create_table :univers do |t|

      t.timestamps
    end
  end
end
