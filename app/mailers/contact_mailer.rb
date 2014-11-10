class ContactMailer < ActionMailer::Base
  
  def contact_message(contact)
    @contact = contact
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "support@lingonas.com", 
    	 subject: "Customer Message",
    	 from: "#{@contact.email}")
  end

end
