class TrialMailer < ActionMailer::Base

  def new_trial_notifier(trial)
    @trial = trial
    
    mail(to: "support@lingonas.com", 
       subject: "Lingonas: trial notifier",
       from: "#{@trial.email}")
  end

  def new_trial_request(trial)
    @trial = trial
    attachments["hosts.pdf"] = File.read("#{Rails.root}/public/attachments/hosts.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    
    mail(to: "#{@trial.course.teacher.email}", 
    	 subject: "Lingonas: lesson request from #{@trial.name}",
    	 from: "#{@trial.email}")
  end

  def new_trial_request_confirmation(trial)
    @trial = trial
    attachments["quick_user_guide.pdf"] = File.read("#{Rails.root}/public/attachments/quick_user_guide.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")

    mail(to: "#{@trial.email}", 
    	 subject: "Lingonas: trial lesson guide",
    	 from: "support@lingonas.com")
  end
end