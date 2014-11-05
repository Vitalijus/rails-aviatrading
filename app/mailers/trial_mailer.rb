class TrialMailer < ActionMailer::Base

  def new_trial_request(trial)
    @trial = trial
    attachments["hosts.pdf"] = File.read("#{Rails.root}/public/attachments/hosts.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Lingonas: lesson request from #{@trial.name}",
    	 from: "support@lingonas.com")
  end

  def new_trial_request_confirmation(trial)
    @trial = trial
    attachments["quick_user_guide.pdf"] = File.read("#{Rails.root}/public/attachments/quick_user_guide.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")

    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Lingonas: trial lesson guide",
    	 from: "support@lingonas.com")
  end
end