class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, presence: true
  validates :email, presence: true
  # validates :user_name, presence: true
  # validates :user_flag, presence: true, numericality: true
end
