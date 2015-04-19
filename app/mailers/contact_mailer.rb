class ContactMailer < ActionMailer::Base
  
  def contact_message(contact)
    @contact = contact
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "info@aviatrading.com", 
    	 subject: "Client Message",
    	 from: @contact.email)
  end

end
