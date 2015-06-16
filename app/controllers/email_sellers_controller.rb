class EmailSellersController < ApplicationController

	def new
		advert = Advert.find(params[:advert_id])
    	@email_seller = advert.email_sellers.build
	end

	def create
		advert = Advert.find(params[:advert_id])
    	@email_seller = advert.email_sellers.create(email_seller_params)

    	if @email_seller.save
			redirect_to advert, notice: "Message has been sent successfully."
			EmailSellerMailer.buyer_request(@email_seller).deliver
			#ContactWorker.perform_async(@contact.id)
		else
			render action: "new", notice: "Sorry, something went wrong. Reach us at info@aviatrading.com"
		end
	end

	private
	 # Never trust parameters from the scary internet, only allow the white list through.
    def email_seller_params
      params.require(:email_seller).permit(:email, :name, :phone, :cpmpany, :country,
      									   :message )
    end
end