class CreateSceneOrders < ActiveRecord::Migration
  def change
    create_table :scene_orders do |t|
      t.integer :order_value
      t.references :story, index: true
      t.references :scene, index: true

      t.timestamps
    end
  end
end
