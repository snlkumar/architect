class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname,:lastname,:email,:contact_no, :password, :password_confirmation, :remember_me,:language,:qualification,
  :role,:country,:avatar
  validates :firstname,:contact_no, presence: true,:length => { :minimum => 3 }
  validates :email,presence: true, uniqueness: true
  has_many :skills,:dependent => :destroy
  accepts_nested_attributes_for :skills
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
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
