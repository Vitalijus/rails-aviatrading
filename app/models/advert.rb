class Advert < ActiveRecord::Base
	geocoded_by :nearest_airport   # can also be an IP address
	after_validation :geocode, :if => :nearest_airport_changed?

	belongs_to :user
	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true
	has_many :email_sellers

	validates :name, :aircraft_type, :year, :country, 
			  :city, :nearest_airport, :make, :model, :aircraft_hours, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true
end
