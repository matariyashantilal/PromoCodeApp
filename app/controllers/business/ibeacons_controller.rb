class Business::IbeaconsController < Business::BaseController
  before_action :set_business_ibeacon, only: [:show, :edit, :update, :destroy]

  # GET /business/ibeacons
  # GET /business/ibeacons.json
  def index
    #@business_ibeacons = Ibeacon.all
    store_id = params[:store_id]
    if params[:store_id].present?
      filterIbeacons = Ibeacon.find_by_store_id(store_id)
      if filterIbeacons == nil
        @business_ibeacons = []   
      else
        @business_ibeacons = @business_ibeacons.to_a.push filterIbeacons
      end
    else
      @business_ibeacons = Ibeacon.includes(:store)
    end
    @stores = current_user.stores
  end

  # GET /business/ibeacons/1
  # GET /business/ibeacons/1.json
  def show
  end

  # GET /business/ibeacons/new
  def new
    if current_user.stores.count <= 0
      flash[:alert] = "Please create new store before creation of new iBeacon."
      redirect_to new_business_store_path
    end
    @business_ibeacon = Ibeacon.new
  end

  # GET /business/ibeacons/1/edit
  def edit
  end

  # POST /business/ibeacons
  # POST /business/ibeacons.json
  def create
    @business_ibeacon = Ibeacon.new(business_ibeacon_params)

    respond_to do |format|
      if @business_ibeacon.save
        format.html { redirect_to business_ibeacon_path(@business_ibeacon), notice: 'Ibeacon was successfully created.' }
        format.json { render :show, status: :created, location: @business_ibeacon }
      else
        flash.now[:alert] = @business_ibeacon.errors.full_messages
        format.html { render :new }
        format.json { render json: @business_ibeacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/ibeacons/1
  # PATCH/PUT /business/ibeacons/1.json
  def update
    respond_to do |format|
      if @business_ibeacon.update(business_ibeacon_params)
        format.html { redirect_to business_ibeacon_path(@business_ibeacon), notice: 'Ibeacon was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_ibeacon }
      else
        flash.now[:alert] = @business_ibeacon.errors.full_messages
        format.html { render :edit }
        format.json { render json: @business_ibeacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/ibeacons/1
  # DELETE /business/ibeacons/1.json
  def destroy
    @business_ibeacon.destroy
    respond_to do |format|
      format.html { redirect_to business_ibeacons_url, notice: 'Ibeacon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_ibeacon
      @business_ibeacon = Ibeacon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_ibeacon_params
      params.require(:ibeacon).permit(:udid, :major, :minor, :store_id)
    end
end
