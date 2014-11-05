class ContactsController < ApplicationController

	def new
	  @contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			ContactMailer.contact_message(@contact).deliver
			redirect_to courses_path, notice: "Message has been sent successfully."
		else
			render action: "new"
		end
	end

	private

	def contact_params
      params.require(:contact).permit(:message, :name, :email)
    end

end