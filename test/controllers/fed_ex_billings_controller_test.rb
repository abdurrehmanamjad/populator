require 'test_helper'

class FedExBillingsControllerTest < ActionController::TestCase
  setup do
    @fed_ex_billing = fed_ex_billings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fed_ex_billings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fed_ex_billing" do
    assert_difference('FedExBilling.count') do
      post :create, fed_ex_billing: { account_number: @fed_ex_billing.account_number, cur_inv_bal: @fed_ex_billing.cur_inv_bal, date_time_import: @fed_ex_billing.date_time_import, del_date: @fed_ex_billing.del_date, del_days: @fed_ex_billing.del_days, del_time: @fed_ex_billing.del_time, inv_date: @fed_ex_billing.inv_date, inv_no: @fed_ex_billing.inv_no, net_charge: @fed_ex_billing.net_charge, processed: @fed_ex_billing.processed, rec_zip: @fed_ex_billing.rec_zip, request_format: @fed_ex_billing.request_format, res: @fed_ex_billing.res, sat: @fed_ex_billing.sat, serv_area_code: @fed_ex_billing.serv_area_code, service: @fed_ex_billing.service, ship_date: @fed_ex_billing.ship_date, ship_zip: @fed_ex_billing.ship_zip, track_no: @fed_ex_billing.track_no }
    end

    assert_redirected_to fed_ex_billing_path(assigns(:fed_ex_billing))
  end

  test "should show fed_ex_billing" do
    get :show, id: @fed_ex_billing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fed_ex_billing
    assert_response :success
  end

  test "should update fed_ex_billing" do
    patch :update, id: @fed_ex_billing, fed_ex_billing: { account_number: @fed_ex_billing.account_number, cur_inv_bal: @fed_ex_billing.cur_inv_bal, date_time_import: @fed_ex_billing.date_time_import, del_date: @fed_ex_billing.del_date, del_days: @fed_ex_billing.del_days, del_time: @fed_ex_billing.del_time, inv_date: @fed_ex_billing.inv_date, inv_no: @fed_ex_billing.inv_no, net_charge: @fed_ex_billing.net_charge, processed: @fed_ex_billing.processed, rec_zip: @fed_ex_billing.rec_zip, request_format: @fed_ex_billing.request_format, res: @fed_ex_billing.res, sat: @fed_ex_billing.sat, serv_area_code: @fed_ex_billing.serv_area_code, service: @fed_ex_billing.service, ship_date: @fed_ex_billing.ship_date, ship_zip: @fed_ex_billing.ship_zip, track_no: @fed_ex_billing.track_no }
    assert_redirected_to fed_ex_billing_path(assigns(:fed_ex_billing))
  end

  test "should destroy fed_ex_billing" do
    assert_difference('FedExBilling.count', -1) do
      delete :destroy, id: @fed_ex_billing
    end

    assert_redirected_to fed_ex_billings_path
  end
end
