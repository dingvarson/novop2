class AddDescrPagtoCli < ActiveRecord::Migration
  def up
    add_column :cadclis, :descr_serv, :text
  end

  def down
  end
end
