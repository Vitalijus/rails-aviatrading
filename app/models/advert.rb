class Advert < ActiveRecord::Base
	geocoded_by :nearest_airport   # can also be an IP address
	after_validation :geocode, :if => :nearest_airport_changed?

	belongs_to :user
	has_many :photos, :dependent => :destroy
	has_many :email_sellers

	#validates :name, :aircraft_type, :aircraft_usage, :year, :country, 
	#		  :city, :price, :nearest_airport, presence: true
	#validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true
	#as well validate nr. of passengers...
end
