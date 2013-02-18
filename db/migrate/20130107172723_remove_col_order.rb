class RemoveColOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :data_venda
  end

  def down
  end
end
