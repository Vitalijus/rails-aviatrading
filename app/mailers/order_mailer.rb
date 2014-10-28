class OrderMailer < ActionMailer::Base
  
  def order_confirmation(order)
    @order = order
    attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Order Confirmation",
    	 from: "info@chocolaticpost.com")
  end
end
