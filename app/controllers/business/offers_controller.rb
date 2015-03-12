class Business::OffersController < Business::BaseController
  before_action :set_business_offer, only: [:show, :edit, :update, :destroy]

  # GET /business/offers
  # GET /business/offers.json
  def index
    #@business_offers = current_user.offers
    store_id = params[:store_id]
    if params[:store_id].present?
      filterOffers = current_user.offers.find_by_store_id(store_id)
      if filterOffers == nil
        @business_offers = []   
      else
        @business_offers = @business_offers.to_a.push filterOffers
      end
    else
      @business_offers = current_user.offers
    end
    @stores = Store.all
  end

  # GET /business/offers/1
  # GET /business/offers/1.json
  def show
  end

  # GET /business/offers/new
  def new
    @business_offer = Offer.new
  end

  # GET /business/offers/1/edit
  def edit
  end

  # POST /business/offers
  # POST /business/offers.json
  def create
    @business_offer = Offer.new(business_offer_params)

    respond_to do |format|
      if @business_offer.save
        format.html { redirect_to business_offer_path(@business_offer), notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @business_offer }
      else
        format.html { render :new }
        format.json { render json: @business_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/offers/1
  # PATCH/PUT /business/offers/1.json
  def update
    respond_to do |format|
      if @business_offer.update(business_offer_params)
        format.html { redirect_to business_offer_path(@business_offer), notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_offer }
      else
        format.html { render :edit }
        format.json { render json: @business_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/offers/1
  # DELETE /business/offers/1.json
  def destroy
    @business_offer.destroy
    respond_to do |format|
      format.html { redirect_to business_offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_offer
      @business_offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_offer_params
      params.require(:offer).permit(:offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on, :store_id, :task_url, :image)
    end
end
