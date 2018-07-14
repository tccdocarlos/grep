class MonthBillsController < ApplicationController
  before_action :set_month_bill, only: [:show, :edit, :update, :destroy]

  # GET /month_bills
  # GET /month_bills.json
  def index
    @month_bills = MonthBill.all
  end

  # GET /month_bills/1
  # GET /month_bills/1.json
  def show
  end

  # GET /month_bills/new
  def new
    @month_bill = MonthBill.new
  end

  # GET /month_bills/1/edit
  def edit
  end

  # POST /month_bills
  # POST /month_bills.json
  def create
    @month_bill = MonthBill.new(month_bill_params)

    respond_to do |format|
      if @month_bill.save
        format.html { redirect_to @month_bill, notice: 'Month bill was successfully created.' }
        format.json { render :show, status: :created, location: @month_bill }
      else
        format.html { render :new }
        format.json { render json: @month_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /month_bills/1
  # PATCH/PUT /month_bills/1.json
  def update
    respond_to do |format|
      if @month_bill.update(month_bill_params)
        format.html { redirect_to @month_bill, notice: 'Month bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @month_bill }
      else
        format.html { render :edit }
        format.json { render json: @month_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_bills/1
  # DELETE /month_bills/1.json
  def destroy
    @month_bill.destroy
    respond_to do |format|
      format.html { redirect_to month_bills_url, notice: 'Month bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month_bill
      @month_bill = MonthBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def month_bill_params
      params.require(:month_bill).permit(:month, :status, :house)
    end
end
