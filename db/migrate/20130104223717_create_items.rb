class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quant
      t.string :descr
      t.float :val_unit
      t.float :val_total
      t.references :order

      t.timestamps
    end
    add_index :items, :order_id
  end
end
