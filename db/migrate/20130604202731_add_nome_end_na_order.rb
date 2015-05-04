class AddNomeEndNaOrder < ActiveRecord::Migration
  def up
    add_column :cadclis, :end_c, :string
    add_column :cadclis, :fone_c, :string
  end

  def down
  end
end
