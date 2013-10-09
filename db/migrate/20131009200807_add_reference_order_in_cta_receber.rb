class AddReferenceOrderInCtaReceber < ActiveRecord::Migration
  def up
    change_table :cta_recebers do |t|
    t.references :order
  end
  end

  def down
  end
end
