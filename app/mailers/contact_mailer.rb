class ContactMailer < ActionMailer::Base
  
  def contact_message(contact)
    @contact = contact
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Customer Message",
    	 from: "vitalij.desuk@gmail.com")
  end

end
