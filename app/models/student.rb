class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :courses

  #validates :terms_conditions , acceptance: { accept: 'accepted', message: "acceptance has failed. Upload page and try again" }
end
