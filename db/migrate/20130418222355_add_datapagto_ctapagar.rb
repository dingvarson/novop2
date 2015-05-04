class AddDatapagtoCtapagar < ActiveRecord::Migration
  def up
    add_column :cta_pagars, :data_pagto, :date
  end

  def down
  end
end
