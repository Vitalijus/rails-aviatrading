class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: "You have been subscribed #{@user.email}")
  end

  def charge_succeeded(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: "Charge succeeded #{@user.email}")
  end

  def invoice_payment_failed(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: "Invoice payment failed #{@user.email}")
  end
end
