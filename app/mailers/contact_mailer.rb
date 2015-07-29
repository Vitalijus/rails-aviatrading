class ContactMailer < ActionMailer::Base
  
  def contact_message(contact)
    @contact = contact
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "info@aviatrading.com", 
    	 subject: "Customer Message",
    	 from: @contact.email,
    	 bcc: "info@aviatrading.com")
  end

end
