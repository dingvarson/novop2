class AddStatusCtareceber < ActiveRecord::Migration
  def up
    add_column :cta_recebers, :status, :string
  end

  def down
  end
end
