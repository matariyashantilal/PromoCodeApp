class Admin::BusinessesController < Admin::BaseController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all  
  end

  def show   
  end

  def new
    @business = Business.new
    @store = @business.stores.build
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to admin_business_path(@business), :notice => "Business was successfully created."
    else
      flash.now[:alert] = @business.errors.full_messages.uniq
      render :new
    end
  end

  def update
    if params[:business][:password].present? ?  @business.update(business_params) : @business.update(business_params_without_password)
        redirect_to admin_business_path(@business), :notice => "Business was successfully updated."
    else
      flash.now[:alert] = @business.errors.full_messages.uniq
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to admin_businesses_path, notice: 'Business was successfully destroyed.'   
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:business_name, :address, :contact_person, :contact_number,:first_name,:last_name,:email,:password,:password_confirmation,stores_attributes: [:id, :name,:address, :latitude, :longitude, :contact_person, :contact_number, :_destroy])
    end

  def business_params_without_password
      params.require(:business).permit(:business_name, :address, :contact_person, :contact_number,:first_name,:last_name,:email,stores_attributes: [:id, :name,:address, :latitude, :longitude, :contact_person, :contact_number, :_destroy])
    end
end
