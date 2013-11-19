class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname,:lastname,:email,:contact_no, :password, :password_confirmation, :remember_me
  validates :firstname,:contact_no, presence: true,:length => { :minimum => 3 }
  validates :email,presence: true, uniqueness: true
  # attr_accessible :title, :body

protected
  def email_required?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:badge)
      where(conditions).where(["lower(badge) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
