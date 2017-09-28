class User < ApplicationRecord
  belongs_to :dependence, optional:true
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
  	has_role?(:admin)
	end

  def hospital?
    has_role?(:hospital)
  end

	def license?
  	has_role?(:license)
	end

	def agent_register?
  	has_role?(:agent_register)
	end
       
end
