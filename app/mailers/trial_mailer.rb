class TrialMailer < ActionMailer::Base

  def new_trial_request(trial)
    @trial = trial
    attachments["SL.pdf"] = File.read("#{Rails.root}/public/attachments/SL.pdf")
    mail(to: "vitalij.desuk@gmail.com", 
    	 subject: "Lesson request from #{@trial.name}",
    	 from: @trial.email)
  end
end