class Teacher < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
  mount_uploader :cv, CvUploader
  mount_uploader :language_proficiency_proof, LanguageProficiencyProofUploader
  mount_uploader :language_proficiency_proof2, LanguageProficiencyProof2Uploader
  mount_uploader :language_proficiency_proof3, LanguageProficiencyProof3Uploader

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
