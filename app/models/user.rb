class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :age_verify
  #relationship
  has_many :orders  

  validates_acceptance_of :age_verify
  validates_acceptance_of :eula, :message => "You must be at least 13"

  def password_required?
   false
  end

  def email_confirmation
  	""
  end

end
