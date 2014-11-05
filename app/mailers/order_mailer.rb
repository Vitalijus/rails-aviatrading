class OrderMailer < ActionMailer::Base
  
  def order_confirmation(order)
    @order = order
    attachments["quick_user_guide.pdf"] = File.read("#{Rails.root}/public/attachments/quick_user_guide.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Lingonas: order confirmation",
    	 from: "support@lingonas.com")
  end

  def order_confirmation_teacher(order)
    @order = order
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Lingonas: new enrollment confirmation",
    	 from: "support@lingonas.com")
  end
end
