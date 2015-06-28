class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(customer_email, customer_created, trial_end)
    @customer_email = customer_email
    @customer_created = customer_created
    @trial_end = trial_end
    mail(to: @customer_email, 
         subject: "Thanks for choosing AviaTrading! Subscription is activated.",
         bcc: "info@aviatrading.com")
  end

  def charge_succeeded(customer_email)
    @customer_email = customer_email
    mail(to: @customer_email, 
         subject: "Charge succeeded",
         bcc: "info@aviatrading.com")
  end

  def invoice_payment_failed(customer_email)
    @customer_email = customer_email
    mail(to: @customer_email, 
         subject: "Invoice payment failed",
         bcc: "info@aviatrading.com")
  end
end
