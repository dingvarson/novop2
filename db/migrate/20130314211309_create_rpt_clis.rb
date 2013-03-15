class CreateRptClis < ActiveRecord::Migration
  def change
    create_table :rpt_clis do |t|

      t.timestamps
    end
  end
end
