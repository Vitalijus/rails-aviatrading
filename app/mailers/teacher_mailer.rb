class TeacherMailer < ActionMailer::Base
  
  def status(teacher)
    @teacher = teacher
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    
    mail(to: @teacher.email,
       bcc: ["support@lingonas.com", "Lingonas <support@lingonas.com>"],
       subject: "Lingonas: account status",
    	 from: "support@lingonas.com")
  end
end
