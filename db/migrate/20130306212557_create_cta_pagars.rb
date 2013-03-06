class CreateCtaPagars < ActiveRecord::Migration
  def change
    create_table :cta_pagars do |t|
      t.string :descricao
      t.string :nomeforn
      t.date :datavencto
      t.float :valor

      t.timestamps
    end
  end
end
