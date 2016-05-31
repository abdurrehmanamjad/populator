class FedExBillingsController < ApplicationController
  before_action :set_fed_ex_billing, only: [:show, :edit, :update, :destroy]

  # GET /fed_ex_billings
  # GET /fed_ex_billings.json
  def index
    @fed_ex_billings = FedExBilling.all
  end

  # GET /fed_ex_billings/1
  # GET /fed_ex_billings/1.json
  def show
  end

  # GET /fed_ex_billings/new
  def new
    @fed_ex_billing = FedExBilling.new
  end

  # GET /fed_ex_billings/1/edit
  def edit
  end

  # POST /fed_ex_billings
  # POST /fed_ex_billings.json
  def create
    @fed_ex_billing = FedExBilling.new(fed_ex_billing_params)

    respond_to do |format|
      if @fed_ex_billing.save
        format.html { redirect_to @fed_ex_billing, notice: 'Fed ex billing was successfully created.' }
        format.json { render :show, status: :created, location: @fed_ex_billing }
      else
        format.html { render :new }
        format.json { render json: @fed_ex_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fed_ex_billings/1
  # PATCH/PUT /fed_ex_billings/1.json
  def update
    respond_to do |format|
      if @fed_ex_billing.update(fed_ex_billing_params)
        format.html { redirect_to @fed_ex_billing, notice: 'Fed ex billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @fed_ex_billing }
      else
        format.html { render :edit }
        format.json { render json: @fed_ex_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fed_ex_billings/1
  # DELETE /fed_ex_billings/1.json
  def destroy
    @fed_ex_billing.destroy
    respond_to do |format|
      format.html { redirect_to fed_ex_billings_url, notice: 'Fed ex billing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fed_ex_billing
      @fed_ex_billing = FedExBilling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fed_ex_billing_params
      params.require(:fed_ex_billing).permit(:account_number, :inv_date, :inv_no, :cur_inv_bal, :track_no, :net_charge, :service, :ship_date, :del_date, :del_time, :serv_area_code, :rec_zip, :ship_zip, :sat, :res, :del_days, :request_format, :date_time_import, :processed)
    end
end
