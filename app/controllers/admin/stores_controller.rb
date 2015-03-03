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
      redirect_to admin_store_path(@store), :notice => "Store Submitted Successfully."
    else
      render :new
    end
  end

  def update
   
    if @store.update(store_params)
        redirect_to admin_store_path(@store), :notice => "store Submitted Updated."
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to admin_stores_path, notice: 'Store was successfully destroyed.'
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :address, :latitude, :longitute, :contact_person, :contact_number)
    end
end
