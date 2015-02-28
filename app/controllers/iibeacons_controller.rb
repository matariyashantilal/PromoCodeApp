class IibeaconsController < ApplicationController
  before_action :set_iibeacon, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @iibeacons = Iibeacon.all
    respond_with(@iibeacons)
  end

  def show
    respond_with(@iibeacon)
  end

  def new
    @iibeacon = Iibeacon.new
    respond_with(@iibeacon)
  end

  def edit
  end

  def create
    @iibeacon = Iibeacon.new(iibeacon_params)
    @iibeacon.save
    respond_with(@iibeacon)
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
