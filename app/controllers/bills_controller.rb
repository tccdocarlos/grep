class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :require_living

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    Bill::Create.new(new_bill_params).call
    redirect_to bills_path, notice: 'Bill was successfully created.'
    rescue Exception => e
      flash.now[:error] = e.message
      @bill = Bill.new(bill_params)
      render :new
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:paid_value, :month_value, :paid_date, :maturity_date, :bill_month_id, :bill_type_id)
    end

    #to convert dates to DateTime objects
    def new_bill_params
      new_params = bill_params
      
      for x in (1..5) do
        #eval('new_params[:paid_date] = params[:bill]["paid_date(#{x}i)"].to_i ')
        eval('new_params.delete("paid_date(#{x}i)")')
      end

      for x in (1..5) do
        #eval('new_params[:maturity_date] = params[:bill]["maturity_date(#{x}i)"].to_i ')
        eval('new_params.delete("maturity_date(#{x}i)")')
      end
      
      new_params[:paid_date] = DateTime.new(params[:bill]["paid_date(1i)"].to_i, 
                                            params[:bill]["paid_date(2i)"].to_i, 
                                            params[:bill]["paid_date(3i)"].to_i, 
                                            params[:bill]["paid_date(4i)"].to_i, 
                                            params[:bill]["paid_date(5i)"].to_i)

      new_params[:maturity_date] = DateTime.new(params[:bill]["maturity_date(1i)"].to_i, 
                                                params[:bill]["maturity_date(2i)"].to_i, 
                                                params[:bill]["maturity_date(3i)"].to_i, 
                                                params[:bill]["maturity_date(4i)"].to_i, 
                                                params[:bill]["maturity_date(5i)"].to_i)

      new_params
    end
end
