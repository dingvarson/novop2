class AddCampoStatusCtapagar < ActiveRecord::Migration
  def up
    add_column :cta_pagars, :status, :string
  end

  def down
  end
end
