class OrderMailer < ActionMailer::Base
  
  def order_confirmation_student(order)
    @order = order
    attachments["quick_user_guide.pdf"] = File.read("#{Rails.root}/public/attachments/quick_user_guide.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    mail(to: "#{@order.student.email}",
       bcc: ["support@lingonas.com", "Lingonas <support@lingonas.com>"], 
    	 subject: "Lingonas: enrollment confirmation",
    	 from: "support@lingonas.com")
  end

  def order_confirmation_teacher(order)
    @order = order
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    mail(to: "#{@order.course.teacher.email}", 
    	 subject: "Lingonas: new enrollment confirmation",
    	 from: "support@lingonas.com")
  end
end
