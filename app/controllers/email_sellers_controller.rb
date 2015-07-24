class EmailSellersController < ApplicationController

	def create
		@advert = Advert.find(params[:advert_id])
    	@email_seller = @advert.email_sellers.create(email_seller_params)

		respond_to do |format|
	      if @email_seller.save
	      	EmailSellerMailer.buyer_request(@email_seller).deliver
	      	#ContactWorker.perform_async(@contact.id)
	        format.html { redirect_to(@advert, :notice => 'Message was successfully sent.') }
	        format.xml  { render :xml => @advert, :status => :created, :location => @advert }
	      else
	        format.html { render :template => "adverts/show" }
	        format.xml  { render :xml => @email_seller.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	private

	 # Never trust parameters from the scary internet, only allow the white list through.
    def email_seller_params
      params.require(:email_seller).permit(:email, :name, :phone, :company, :country,
      									   :message )
    end
end