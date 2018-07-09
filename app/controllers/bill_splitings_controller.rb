class BillSplitingsController < ApplicationController
  before_action :set_bill_splitings
  before_action :set_bill_spliting, only: [:show, :edit, :update, :destroy]

  # GET bill_types/1/bill_splitings
  def index
    @bill_splitings = @bill_type.bill_splitings
  end

  # GET bill_types/1/bill_splitings/1
  def show
  end

  # GET bill_types/1/bill_splitings/new
  def new
    
    #TODO: just dwellers from the right house
    @dwellers = Dweller.all
    
    @bill_spliting = @bill_type.bill_splitings.build
  end

  # GET bill_types/1/bill_splitings/1/edit
  def edit
  end

  # POST bill_types/1/bill_splitings
  def create
    #dweller = Dweller.first
    #params = bill_spliting_params
    #params[:dweller] = dweller
    #@bill_spliting = @bill_type.bill_splitings.build(params)
    @bill_spliting = BillSpliting::Create.new(@bill_type, bill_spliting_params).call()

    puts "######## #{params}"

    if @bill_spliting
      redirect_to(bill_type_bill_splitings_path(@bill_type), notice: 'Bill spliting was successfully created.')
    else
      render action: 'new'
    end


  end

  # PUT bill_types/1/bill_splitings/1
  def update
    if @bill_spliting.update_attributes(bill_spliting_params)
      redirect_to([@bill_spliting.bill_type, @bill_spliting], notice: 'Bill spliting was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE bill_types/1/bill_splitings/1
  def destroy
    @bill_spliting.destroy

    redirect_to bill_type_bill_splitings_url(@bill_type)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_splitings
      @bill_type = BillType.find(params[:bill_type_id])
    end

    def set_bill_spliting
      @bill_spliting = @bill_type.bill_splitings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_spliting_params
      params.require(:bill_spliting).permit(:value, :dweller_id)
    end
end
