class EmailSellerMailer < ActionMailer::Base
  
  def buyer_request(email_seller)
    @email_seller = email_seller
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: @email_seller.advert.email, 
    	 subject: "Buyers Request",
    	 from: "info@aviatrading.com")
  end

end