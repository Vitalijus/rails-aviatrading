class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(user)
    @user = user
    mail(to: @user, 
         subject: "Thanks for choosing AviaTrading! Subscription is activated.",
         bcc: "info@aviatrading.com",
         reply_to: "no-reply@aviatrading.com")
  end

  def charge_succeeded(user)
    @user = user
    mail(to: "info@aviatrading.com", 
         subject: "Charge succeeded")
  end

  def invoice_payment_failed(user)
    @user = user
    mail(to: "info@aviatrading.com", 
         subject: "Invoice payment failed")
  end
end
