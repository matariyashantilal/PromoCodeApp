class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  ## validations       

  
 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates_confirmation_of :password
  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: VALID_EMAIL_REGEX, allow_blank: true, if: :email_changed?,:message => "Please use a valid email address."

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: 8..128, allow_blank: true,:message => "length cannot be less than 8 characters."
  validates :password, confirmation: true, :presence => true,:if => :password_required?

   def email_required?
        true
   end
 
   ## Custom Attributes ##
  attr_accessor :check_device_type_validation,:password_not_required
  ##associations
   has_many :authentication_tokens, :dependent => :destroy
   #
  scope :get_user_device_ids,lambda { |device_id| where("device_id = ?", device_id) }
  scope :without_user, lambda{|user| where (user ? ["id != ?", user.id] : {}) } 
  
  ## Class Methods ##
  class << self
    def authenticate_user_with_auth(email, password)
      return nil unless email.present? or password.present?
      u = User.find_by_email(email)
      (u.present? && u.valid_password?(password))? u : nil
    end

    def invalid_credentials
      "Email or Password is not valid"
    end

    def success_message
      {:message=> "ok", :errorcode => "",:rstatus=>1}
    end
    
    def register_with_social_media(token,email,oauth_token)
        u             = User.new 
        logger.warn("===========#{token.fetch.raw_attributes[:id]}")
        u.password_not_required    = 1
        u.provider    = "facebook"
        u.email       = email
        u.first_name  = token.fetch.first_name
        u.last_name   = token.fetch.last_name
        u.oauth_token = oauth_token
        return u
    end
  
  end

  def check_duplicate_device_ids(device_id,user)
    @users = User.without_user(user).get_user_device_ids(device_id)
    if @users.present?
    @users.update_all({:device_id => nil})
    end
    user.device_id = device_id
    user.save 
  end

  def admin?
    self.type == "Admin"
  end
  
  def business?
    self.type == "Business"
  end

  def customer?
    self.type == "Customer"
  end

 
  ## Instance Method ##
  def password_required?
    if password_not_required == 1
      false
    else
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
  end

  def fullname
    "#{first_name} #{last_name}"
  end
   
  def set_password_not_required
    self.password_not_required = 1
  end

  def display_errors
    self.errors.full_messages.join(', ')
  end
end
