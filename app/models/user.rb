class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_image, CoverUploader

  has_many :adverts, dependent: :destroy

  #def to_param
	# "#{id} #{name} #{surname}".parameterize
  #end
end
