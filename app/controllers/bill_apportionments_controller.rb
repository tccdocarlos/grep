class BillApportionmentsController < ApplicationController
  before_action :set_bill_apportionments
  before_action :set_bill_apportionment, only: [:show, :edit, :update, :destroy]

  # GET bills/1/bill_apportionments
  def index
    @bill_apportionments = @bill.bill_apportionments
  end

  # GET bills/1/bill_apportionments/1
  def show
  end

  # GET bills/1/bill_apportionments/new
  def new
    
    #TODO: just dwellers from the right house
    @dwellers = Dweller.all
    
    @bill_apportionment = @bill.bill_apportionments.build
  end

  # GET bills/1/bill_apportionments/1/edit
  def edit
  end

  # POST bills/1/bill_apportionments
  def create
    @bill_apportionment = @bill.bill_apportionments.build(bill_apportionment_params)

    if @bill_apportionment.save
      redirect_to([@bill_apportionment.bill, @bill_apportionment], notice: 'Bill apportionment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT bills/1/bill_apportionments/1
  def update
    if @bill_apportionment.update_attributes(bill_apportionment_params)
      redirect_to([@bill_apportionment.bill, @bill_apportionment], notice: 'Bill apportionment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE bills/1/bill_apportionments/1
  def destroy
    @bill_apportionment.destroy

    redirect_to bill_bill_apportionments_url(@bill)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_apportionments
      @bill = Bill.find(params[:bill_id])
    end

    def set_bill_apportionment
      @bill_apportionment = @bill.bill_apportionments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_apportionment_params
      params.require(:bill_apportionment).permit(:value, :dweller_id)
    end
end
