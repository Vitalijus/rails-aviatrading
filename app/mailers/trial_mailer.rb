class TrialMailer < ActionMailer::Base

  def new_trial_request(trial)
    @trial = trial
    attachments["hosts.pdf"] = File.read("#{Rails.root}/public/attachments/hosts.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")
    
    mail(to: "support@lingonas.com", 
    	 subject: "Lingonas: lesson request from #{@trial.name}",
    	 from: @trial.email)
  end

  def new_trial_request_confirmation(trial)
    @trial = trial
    attachments["quick_user_guide.pdf"] = File.read("#{Rails.root}/public/attachments/quick_user_guide.pdf")
    attachments.inline['bg.jpg'] = File.read("#{Rails.root}/public/images_attached/bg.jpg")

    mail(to: "support@lingonas.com", 
    	 subject: "Lingonas: trial lesson guide",
    	 from: @trial.email)
  end
end