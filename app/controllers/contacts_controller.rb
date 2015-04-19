class ContactsController < ApplicationController

	def new
	  @contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			redirect_to new_contact_path, notice: "Message has been sent successfully."
			ContactMailer.contact_message(@contact).deliver
			#ContactWorker.perform_async(@contact.id)
		else
			render action: "new", notice: "Sorry, something went wrong. Reach us at info@aviatrading.com"
		end
	end

	private

	def contact_params
      params.require(:contact).permit(:message, :name, :email)
    end

end