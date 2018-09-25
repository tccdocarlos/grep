class BillTypesController < ApplicationController
  before_action :set_bill_type, only: [:show, :edit, :update, :destroy, :split]
  before_action :require_living

  # GET /bill_types
  # GET /bill_types.json
  def index
    #FIX: IF USER DOESNT HAVE A HOUSE, IT GIVES AN ERROR
    @bill_types = BillType.where('house_id = ?', current_user.dweller.house.id)
  end

  # GET /bill_types/1
  # GET /bill_types/1.json
  def show
  end

  # GET /bill_types/new
  def new
    @bill_type = BillType.new
    @bill_splitings = @bill_type.bill_splitings.build
    @dwellers = Dweller.where("house_id = ?", current_user.dweller.house.id)
  end

  # GET /bill_types/1/edit
  def edit
  end

  # POST /bill_types
  # POST /bill_types.json
  def create
    # REFACTOR BECAUSE IT CONSULTS A LOT OF DB
    responsible = current_user.dweller  
    params = bill_type_params   
    params[:house_id] = current_user.dweller.house.id
    
    BillType::Create.new(responsible, params).call()
    redirect_to bill_types_path, notice: 'Bill type was successfully created.'
    rescue Exception => e
      flash.now[:error] = e.message
      @bill_type = BillType.new(bill_type_params)
      render :new
  end

  # PATCH/PUT /bill_types/1
  # PATCH/PUT /bill_types/1.json
  def update
    respond_to do |format|
      if @bill_type.update(bill_type_params)
        format.html { redirect_to @bill_type, notice: 'Bill type was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_type }
      else
        format.html { render :edit }
        format.json { render json: @bill_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_types/1
  # DELETE /bill_types/1.json
  def destroy
    @bill_type.destroy
    respond_to do |format|
      format.html { redirect_to bill_types_url, notice: 'Bill type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_type
      @bill_type = BillType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_type_params
      params.require(:bill_type).permit(:name, :description, :maturity, :value, bill_splitings_attributes: [:id, :value, :dweller_id, :_destroy])
    end
end
