class CreateAnotacaos < ActiveRecord::Migration
  def change
    create_table :anotacaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
