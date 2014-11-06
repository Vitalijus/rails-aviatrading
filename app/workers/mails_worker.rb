class MailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(order_id)
  	order = Order.find(order_id)
    OrderMailer.order_confirmation(order).deliver
    OrderMailer.order_confirmation_teacher(order).deliver
  end
end