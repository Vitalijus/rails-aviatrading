class Teacher < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses, dependent: :destroy

  validates :name, :surname, presence: true

  def to_param
	"#{id} #{name} #{surname}".parameterize
  end

end
