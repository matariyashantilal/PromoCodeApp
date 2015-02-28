class Admin::IbeaconsController < Admin::BaseController
  before_action :set_ibeacon, only: [:show, :edit, :update, :destroy]



  def index
    @ibeacons = Ibeacon.all
    
  end

  def show
   
  end

  def new
    @ibeacon = Ibeacon.new
   
  end

  def edit
  end

  def create
    @ibeacon = Ibeacon.new(ibeacon_params)
    if @ibeacon.save
      redirect_to admin_ibeacon_path(@ibeacon), :notice => "Ibeacon Submitted Successfully."
    else
      render :new
    end
  end

  def update
    if  @ibeacon.update(ibeacon_params)
        redirect_to admin_ibeacon_path(@ibeacon), :notice => "Ibeacon Submitted Updated."
    else
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
      params.require(:ibeacon).permit(:udid, :major, :minor)
    end
end
