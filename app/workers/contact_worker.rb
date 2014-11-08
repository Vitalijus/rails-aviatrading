class ContactWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(contact_id)
  	contact = Contact.find(contact_id)
    ContactMailer.contact_message(contact).deliver
  end
end