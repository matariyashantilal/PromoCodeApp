class Admin::StoresController <Admin::BaseController
  before_action :set_store, only: [:show, :edit, :update, :destroy]


  def index
    #@stores = Store.all
    business_id = params[:business_id]
    if params[:business_id].present?
      filterStores = Store.find_by_business_id(business_id)
      if filterStores == nil
        @stores = []   
      else
        @stores = @stores.to_a.push filterStores
      end
    else
      @stores = Store.all
    end
    @businesses = Business.all
  end

  def show

  end

  def new
    @store = Store.new
    @offer = @store.offers.build
    @ibeacon = @store.ibeacons.build
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_store_path(@store), :notice => "Store created successfully."
    else
      flash.now[:alert] = @store.errors.full_messages
      render :new
    end
  end

  def update
   
    if @store.update(store_params)
        redirect_to admin_store_path(@store), :notice => "Store updated successfully."
    else
      flash.now[:alert] = @store.errors.full_messages
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to admin_stores_path, notice: 'Store destroyed successfully.'
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :address, :latitude, :longitude, :contact_person, :contact_number, :business_id, offers_attributes: [:id, :offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on, :task_url, :image, :_destroy], ibeacons_attributes: [:id, :udid, :major, :minor, :_destroy])
    end

end
