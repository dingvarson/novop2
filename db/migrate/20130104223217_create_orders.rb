class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :nome_cli
      t.string :end_cli
      t.string :fone_cli
      t.date :data_venda

      t.timestamps
    end
  end
end
