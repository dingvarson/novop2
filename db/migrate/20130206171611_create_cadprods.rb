class CreateCadprods < ActiveRecord::Migration
  def change
    create_table :cadprods do |t|
      t.string :nomeprod
      t.integer :quantprod
      t.float :valunit
      t.float :total

      t.timestamps
    end
  end
end
