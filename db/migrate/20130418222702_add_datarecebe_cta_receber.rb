class AddDatarecebeCtaReceber < ActiveRecord::Migration
  def up
    add_column :cta_recebers, :data_recebimento, :date, :status
  end

  def down
  end
end
