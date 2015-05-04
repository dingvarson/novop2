class AddEmailCadcli < ActiveRecord::Migration
  def up
   add_column :cadclis, :emailcli, :string
  end

  def down
    
  end
end
