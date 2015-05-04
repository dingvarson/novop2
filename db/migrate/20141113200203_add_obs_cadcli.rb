class AddObsCadcli < ActiveRecord::Migration
  def up
    add_column :cadclis, :obs, :text
  end

  def down
  end
end
