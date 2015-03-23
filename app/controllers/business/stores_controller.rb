class Business::StoresController < Business::BaseController
  before_action :set_business_store, only: [:show, :edit, :update, :destroy]

  # GET /business/stores
  # GET /business/stores.json
  def index
    #@business_stores = current_user.stores
    business_id = params[:business_id]
    if params[:business_id].present?
      filterStores = current_user.stores.find_by_business_id(business_id)
      if filterStores == nil
        @business_stores = []   
      else
        @business_stores = @business_stores.to_a.push filterStores
      end
    else
      @business_stores = current_user.stores
    end    
  end

  # GET /business/stores/1
  # GET /business/stores/1.json
  def show
  end

  # GET /business/stores/new
  def new
    @business_store = current_user.stores.build
    @offer = @business_store.offers.build
    @ibeacon = @business_store.ibeacons.build
  end

  # GET /business/stores/1/edit
  def edit
  end

  # POST /business/stores
  # POST /business/stores.json
  def create
    @business_store = current_user.stores.build(business_store_params)
    respond_to do |format|
      if @business_store.save
        format.html { redirect_to business_store_path(@business_store), notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @business_store }
      else
        flash.now[:alert] = @business_store.errors.full_messages
        format.html { render :new }
        format.json { render json: @business_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/stores/1
  # PATCH/PUT /business/stores/1.json
  def update
    respond_to do |format|
      if @business_store.update(business_store_params)
        format.html { redirect_to business_store_path(@business_store), notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_store }
      else
        flash.now[:alert] = @business_store.errors.full_messages
        format.html { render :edit }
        format.json { render json: @business_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/stores/1
  # DELETE /business/stores/1.json
  def destroy
    @business_store.destroy
    respond_to do |format|
      format.html { redirect_to business_stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_store
      @business_store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_store_params
      params.require(:store).permit(:name, :address, :latitude, :longitude, :contact_person, :contact_number, :business_id, offers_attributes: [:id, :offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on, :task_url, :image, :_destroy], ibeacons_attributes: [:id, :udid, :major, :minor, :_destroy])
    end
end
