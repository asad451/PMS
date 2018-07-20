class User < ApplicationRecord
  enum role: [:user, :manager, :admin]
  enum status: [:disable, :enable]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def active_for_authentication? 
    super && enable? 
  end 
  
  def inactive_message
    if enable? 
      super
    else
      :not_approved
    end 
  end
end
