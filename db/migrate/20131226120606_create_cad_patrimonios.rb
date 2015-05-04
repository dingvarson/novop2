class CreateCadPatrimonios < ActiveRecord::Migration
  def change
    create_table :cad_patrimonios do |t|
      t.string :descricao
      t.string :cliente
      t.string :tipo_contrato

      t.timestamps
    end
  end
end
