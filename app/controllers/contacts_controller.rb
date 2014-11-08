class ContactsController < ApplicationController

	def new
	  @contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			redirect_to courses_path, notice: "Message has been sent successfully."
			ContactWorker.perform_async(@contact.id)
		else
			render action: "new"
		end
	end

	private

	def contact_params
      params.require(:contact).permit(:message, :name, :email)
    end

end