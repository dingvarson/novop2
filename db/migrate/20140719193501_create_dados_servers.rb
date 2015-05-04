class CreateDadosServers < ActiveRecord::Migration
    def change
    create_table :dados_servers do |t|
      t.string :email
      t.string :senha
      t.timestamps
    end
  end
end

