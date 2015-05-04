class CreateCtaRecebers < ActiveRecord::Migration
  def change
    create_table :cta_recebers do |t|
      t.string :nomecli
      t.string :descr_serv
      t.float :valor

      t.timestamps
    end
  end
end
