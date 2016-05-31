class CreateFedExBillings < ActiveRecord::Migration
  def change
    create_table :fed_ex_billings do |t|
      t.string :account_number
      t.datetime :inv_date
      t.string :inv_no
      t.float :cur_inv_bal
      t.string :track_no
      t.float :net_charge
      t.string :service
      t.datetime :ship_date
      t.datetime :del_date
      t.datetime :del_time
      t.string :serv_area_code
      t.string :rec_zip
      t.string :ship_zip
      t.string :sat
      t.string :res
      t.integer :del_days
      t.string :request_format
      t.datetime :date_time_import
      t.boolean :processed

      t.timestamps null: false
    end
  end
end
