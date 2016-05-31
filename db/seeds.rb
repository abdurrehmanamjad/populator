require 'roo'

FILE_NAME = '541437551.xls'
INDEX_TRACKING_ID_CHARGE_DESCRIPTION = [98, 100, 102, 104, 106]

def fed_ex_billing_params(params)
  params.permit(:account_number, :inv_date, :inv_no, :cur_inv_bal, :track_no, :net_charge, :service, :serv_area_code, :rec_zip, :ship_zip)
end

excel_file = Roo::Spreadsheet.open(FILE_NAME)
excel_file.each_with_index(
		account_number: 			'Bill to Account Number',
		inv_date: 						'Invoice Date',
		inv_no: 							'Invoice Number',
		cur_inv_bal: 					'Current Balance',
		track_no: 						'Express or Ground Tracking ID',
		net_charge: 					'Net Charge Amount',
		service: 							'Service Type',
		ship_date: 						'Shipment Date',
		del_date: 						'POD Delivery Date',
		del_time: 						'POD Delivery Time',
		serv_area_code: 			'POD Service Area Code',
		rec_zip: 							'Recipient Zip Code',
		ship_zip: 						'Shipper Zip Code',
		# sat: 									'Tracking ID Charge Description',
		# res: 									'Tracking ID Charge Description',
		# If there is a value in Ground Tracking ID Prefix only then append it before TrackNo field.
		track_no_prefix: 			'Ground Tracking ID Prefix'
	) do |row, index|
	# Skipping the first row of the document which is header
	unless index == 0
		params = ActionController::Parameters.new(row)
		@fed_ex_billing = FedExBilling.new(fed_ex_billing_params(params))
		
		ship_date_combined = row[:ship_date] if row[:ship_date].to_i > 0
		@fed_ex_billing.ship_date = Date.strptime(ship_date_combined, '%Y%m%d') if ship_date_combined.present?

		del_date_combined = row[:del_date] if row[:del_date].to_i > 0
		@fed_ex_billing.del_date = Date.strptime(del_date_combined, '%Y%m%d') if del_date_combined.present?

		del_time_combined = row[:del_time].split(//).last(4).join if row[:del_time].present?
		@fed_ex_billing.del_time = Time.strptime("#{del_date_combined}/#{del_time_combined}", '%Y%m%d/%H%M') if del_time_combined.present? and del_date_combined.present?

		# SETTING UP THE TRACK NO. PREFIX
		@fed_ex_billing.track_no = row[:track_no_prefix].to_s + row[:track_no].to_s if row[:track_no_prefix].present?
		# SETTING UP THE SAT VALUE
		@fed_ex_billing.sat = "Y" if excel_file.row(index + 1)[98] == "Saturday Delivery"
		# SETTING UP THE RES VALUE
		@fed_ex_billing.res = "Y" if (excel_file.row(index+1)[98] == "Residential" or excel_file.row(index+1)[100] == "Residential" or excel_file.row(index+1)[102] == "Residential" or excel_file.row(index+1)[104] == "Residential" or excel_file.row(index+1)[106] == "Residential")

		# if @fed_ex_billing.save
		# 	puts 'created'
		# else
		# 	puts 'not created'
		# end
		#  puts row.inspect
		# break
	end
end 

