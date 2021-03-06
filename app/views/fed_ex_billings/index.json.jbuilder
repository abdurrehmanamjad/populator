json.array!(@fed_ex_billings) do |fed_ex_billing|
  json.extract! fed_ex_billing, :id, :account_number, :inv_date, :inv_no, :cur_inv_bal, :track_no, :net_charge, :service, :ship_date, :del_date, :del_time, :serv_area_code, :rec_zip, :ship_zip, :sat, :res, :del_days, :request_format, :date_time_import, :processed
  json.url fed_ex_billing_url(fed_ex_billing, format: :json)
end
