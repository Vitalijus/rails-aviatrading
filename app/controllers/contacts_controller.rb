class ContactsController < ApplicationController

	def new
	  @contact = Contact.new
	end

	def contact_params
      params.require(:contact).permit(:message, :name, :email)
    end

end