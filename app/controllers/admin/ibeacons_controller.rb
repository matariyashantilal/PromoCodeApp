class Admin::IbeaconsController < Admin::BaseController
  before_action :set_ibeacon, only: [:show, :edit, :update, :destroy]

  def index
    store_id = params[:store_id]
    if params[:store_id].present?
      filterIbeacons = Ibeacon.find_by_store_id(store_id)
      if filterIbeacons == nil
        @ibeacons = []   
      else
        @ibeacons = @ibeacons.to_a.push filterIbeacons
      end
    else
      @ibeacons = Ibeacon.includes(:store)
    end
    @stores = Store.all
  end

  def show
   
  end

  def new
    if Store.count <= 0
      flash[:alert] = "Please create new store before creation of new iBeacon."
      redirect_to new_admin_store_path
    end
    @ibeacon = Ibeacon.new
  end

  def edit
  end

  def create
    @ibeacon = Ibeacon.new(ibeacon_params)
    if @ibeacon.save
      redirect_to admin_ibeacon_path(@ibeacon), :notice => "Ibeacon was successfully created."
    else
      flash.now[:alert] = @ibeacon.errors.full_messages
      render :new
    end
  end

  def update
    if  @ibeacon.update(ibeacon_params)
        redirect_to admin_ibeacon_path(@ibeacon), :notice => "Ibeacon was successfully updated."
    else
      flash.now[:alert] = @ibeacon.errors.full_messages
      render :edit
    end
  end

  def destroy
    @ibeacon.destroy
     redirect_to admin_ibeacons_path, notice: 'Ibeacon was successfully destroyed.'   
    end

  private
    def set_ibeacon
      @ibeacon = Ibeacon.find(params[:id])
    end

    def ibeacon_params
      params.require(:ibeacon).permit(:udid, :major, :minor, :store_id)
    end
end
