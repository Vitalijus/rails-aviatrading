class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: 'You have been subscribed')
  end

  def customer_subscription_updated(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: 'You have updated your subscription')
  end

  def invoice_payment_succeeded(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: 'Invoice payment succeeded')
  end

  def invoice_payment_failed(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: 'Invoice payment failed')
  end
end
