class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:name, :member, :profile, :works)
    end
end
