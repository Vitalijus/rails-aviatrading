class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :message, length: {maximum: 400}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true
end
