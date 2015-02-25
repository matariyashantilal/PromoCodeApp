class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ## validations       
  validates :password, :length => {:in => 6..128},:if => :password_required?
  validates :password, :presence => true, :if => :password_required?

  validates_confirmation_of :password
  validates :email, :first_name,:last_name, :presence => true
 
  enum role: [:business ,:admin, :customer]
   ## Custom Attributes ##
  attr_accessor :check_device_type_validation,:password_not_required
  ##associations
   has_many :authentication_tokens, :dependent => :destroy
   
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
