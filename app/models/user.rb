class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  ROLES = %w[admin reader editor]
  
  def name
    first_name + " " + last_name
  end
  
  def admin?
    role == 'admin'
  end
  
  def user?
    role == 'user'
  end
  
  def reader?
    role == 'reader'
  end
end
