class Business::BusinessesController < Business::BaseController
  before_action :set_business_business, only: [:show, :edit, :update, :destroy]

  # GET /business/businesses
  # GET /business/businesses.json
  def index
    @business_businesses = Business.all
  end

  # GET /business/businesses/1
  # GET /business/businesses/1.json
  def show
  end

  # GET /business/businesses/new
  def new
    @business_business = Business.new
  end

  # GET /business/businesses/1/edit
  def edit
  end

  # POST /business/businesses
  # POST /business/businesses.json
  def create
    @business_business = Business.new(business_business_params)

    respond_to do |format|
      if @business_business.save
        format.html { redirect_to @business_business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business_business }
      else
        format.html { render :new }
        format.json { render json: @business_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/businesses/1
  # PATCH/PUT /business/businesses/1.json
  def update
    respond_to do |format|
      if @business_business.update(business_business_params)
        format.html { redirect_to business_business_path(@business_business), notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_business }
      else
        flash.now[:alert] = @business_business.errors.full_messages
        format.html { render :edit }
        format.json { render json: @business_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/businesses/1
  # DELETE /business/businesses/1.json
  def destroy
    @business_business.destroy
    respond_to do |format|
      format.html { redirect_to business_businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_business
      @business_business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_business_params
      params.require(:business).permit(:business_name, :address, :contact_person, :contact_number)
    end
end
