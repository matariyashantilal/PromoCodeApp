class Admin::IibeaconsController < Admin::BaseController
  before_action :set_iibeacon, only: [:show, :edit, :update, :destroy]



  def index
    @iibeacons = Iibeacon.all
     respond_to do |format|
        format.html { redirect_to admin_iibeacons_path }
     end
  end

  def show
   
  end

  def new
    @iibeacon = Iibeacon.new
   
  end

  def edit
  end

  def create
    @iibeacon = Iibeacon.new(iibeacon_params)
   
  end

  def update
    @iibeacon.update(iibeacon_params)
    respond_with(@iibeacon)
  end

  def destroy
    @iibeacon.destroy
    respond_with(@iibeacon)
  end

  private
    def set_iibeacon
      @iibeacon = Iibeacon.find(params[:id])
    end

    def iibeacon_params
      params.require(:iibeacon).permit(:udid, :major, :minor)
    end
end
