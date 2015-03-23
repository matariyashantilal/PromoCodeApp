class Admin::OffersController < Admin::BaseController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    store_id = params[:store_id]
    if store_id.present?
      @offers = Offer.where("store_id = ?",store_id).includes(:store)
    else
      @offers = Offer.all.includes(:store)
    end
    @stores = Store.all
  end

  def show
   
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
   if @offer.save
      redirect_to admin_offer_path(@offer), :notice => "offer Submitted Successfully."
    else
      flash.now[:alert] = @offer.errors.full_messages
      render :new
    end
  end

  def update
    if  @offer.update(offer_params)
        redirect_to admin_offer_path(@offer), :notice => "offer Submitted Updated."
    else
      flash.now[:alert] = @offer.errors.full_messages
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to admin_offers_path, notice: 'offer was successfully destroyed.' 
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end
    def offer_params
      params.require(:offer).permit(:offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on, :store_id, :task_url, :image)
    end
end
