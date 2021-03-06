class CourseMailer < ActionMailer::Base
  
  def course_expiration(course)
    @course = course
    attachments["hosts.pdf"] = File.read("#{Rails.root}/public/attachments/hosts.pdf")
    #attachments["template.pdf"] = File.read("#{Rails.root}/public/attachments/template.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    mail(to: "#{@course.teacher.email}",
    	 bcc: ["support@lingonas.com", "Lingonas <support@lingonas.com>"], 
    	 subject: "Lingonas: course confirmation",
    	 from: "support@lingonas.com")
  end
  
end
