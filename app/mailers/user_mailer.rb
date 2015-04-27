class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(user)
    @user = user
    mail(to: "info@aviatrading.com", subject: "You have been subscribed")
  end

  def charge_succeeded(user)
    @user = user
    mail(to: "info@aviatrading.com", subject: "Charge succeeded")
  end

  def invoice_payment_failed(user)
    @user = user
    mail(to: "info@aviatrading.com", subject: "Invoice payment failed")
  end
end
