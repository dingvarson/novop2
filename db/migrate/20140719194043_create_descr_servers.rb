class CreateDescrServers < ActiveRecord::Migration
  def change
    create_table :descr_servers do |t|
      t.text :cliente
      t.text :dns
      t.references :dados_server
      t.timestamps
    end
    add_index :descr_servers, :dados_server_id
  end
end