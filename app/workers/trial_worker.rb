class TrialWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(trial_id)
  	trial = Trial.find(trial_id)
    TrialMailer.new_trial_request(trial).deliver
	TrialMailer.new_trial_request_confirmation(trial).deliver
  end
end