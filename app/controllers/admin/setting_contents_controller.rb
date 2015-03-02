class Admin::SettingContentsController < Admin::BaseController
  before_action :set_setting_content, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @setting_contents = SettingContent.all
    respond_with(@setting_contents)
  end

  def show
    @setting_contents = SettingContent.first
    #redirect_to admin_setting_content_path
    #respond_with(@setting_content)
  end

  def new
    @setting_content = SettingContent.new
    respond_with(@setting_content)
  end

  def edit
  end

  def create
    @setting_content = SettingContent.new(setting_content_params)
    @setting_content.save
    respond_with(@setting_content)
  end

  def update
    @setting_content.update(setting_content_params)
    #respond_with(@setting_content)
    redirect_to admin_setting_content_path(@setting_content)
  end

  def destroy
    @setting_content.destroy
    respond_with(@setting_content)
  end

  private
    def set_setting_content
      @setting_content = SettingContent.find(params[:id])
    end

    def setting_content_params
      params.require(:setting_content).permit(:terms_condition, :about_us)
    end
end
