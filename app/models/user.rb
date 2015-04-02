class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, presence: true
  validates :user_name, presence: true
  # validates :user_name, presence: true
  # validates :user_flag, presence: true, numericality: true



  mount_uploader :profilepic, ProfilepicUploader


  has_and_belongs_to_many :shifts
  has_many :guardians
  has_many :students


  def email_required?
    false
  end

  def email_changed?
    false
  end

end
