class BillMonthsController < ApplicationController
  before_action :set_bill_month, only: [:show, :edit, :update, :destroy]

  # GET /bill_months
  # GET /bill_months.json
  def index
    @bill_months = BillMonth.all
  end

  # GET /bill_months/1
  # GET /bill_months/1.json
  def show
  end

  # GET /bill_months/new
  def new
    @bill_month = BillMonth.new
  end

  # GET /bill_months/1/edit
  def edit
  end

  # POST /bill_months
  # POST /bill_months.json
  def create
    @bill_month = BillMonth.new(bill_month_params)

    respond_to do |format|
      if @bill_month.save
        format.html { redirect_to @bill_month, notice: 'Bill month was successfully created.' }
        format.json { render :show, status: :created, location: @bill_month }
      else
        format.html { render :new }
        format.json { render json: @bill_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_months/1
  # PATCH/PUT /bill_months/1.json
  def update
    respond_to do |format|
      if @bill_month.update(bill_month_params)
        format.html { redirect_to @bill_month, notice: 'Bill month was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_month }
      else
        format.html { render :edit }
        format.json { render json: @bill_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_months/1
  # DELETE /bill_months/1.json
  def destroy
    @bill_month.destroy
    respond_to do |format|
      format.html { redirect_to bill_months_url, notice: 'Bill month was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_month
      @bill_month = BillMonth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_month_params
      params.require(:bill_month).permit(:month, :status, :house_id)
    end
end
