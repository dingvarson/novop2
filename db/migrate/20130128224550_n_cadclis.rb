class NCadclis < ActiveRecord::Migration
 def change
    create_table :cadclis do |t|
      t.string :nomecli
      t.string :status
      t.float :valor
      t.date :datavencto
   
      t.timestamps
    end
  end
end
