class CourseMailer < ActionMailer::Base
  
  def course_expiration(course)
    @course = course
    #attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Course Expiration",
    	 from: "vitalij.desuk@gmail.com")
  end
  
end
