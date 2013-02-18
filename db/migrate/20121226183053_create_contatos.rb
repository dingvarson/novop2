class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :nome_completo
      t.string :telefone
      t.string :celular
      t.string :grupo
      t.date :aniversario

      t.timestamps
    end
  end
end

