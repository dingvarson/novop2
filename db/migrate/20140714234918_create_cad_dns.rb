class CreateCadDns < ActiveRecord::Migration
  def change
    create_table :cad_dns do |t|
      t.string :email
      t.string :senha
      t.string :cliente
      t.string :dns

      t.timestamps
    end
  end
end
