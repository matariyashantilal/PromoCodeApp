class Admin::StoresController <Admin::BaseController
  before_action :set_store, only: [:show, :edit, :update, :destroy]


  def index
    @stores = Store.all
   
  end

  def show

  end

  def new
    @store = Store.new
  
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_store_path(@store), :notice => "Store created successfully."
    else
      render :new
    end
  end

  def update
   
    if @store.update(store_params)
        redirect_to admin_store_path(@store), :notice => "Store updated successfully."
    else
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
      params.require(:store).permit(:name, :address, :latitude, :longitute, :contact_person, :contact_number, :business_id, offers_attributes: [:id, :offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on, :task_url, :_destroy], ibeacons_attributes: [:id, :udid, :major, :minor, :_destroy])
    end

end
